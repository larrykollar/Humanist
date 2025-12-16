-- Expand %var% or %a.b.c% based on metadata.
-- Works on any nesting level.
-- Started out vibe-coded via Copilot/Claude, then fixed by LK.

local metadata = {}

-- Helper: get nested metadata value from dotted path
local function get_from_metadata(meta, path)
  local value = meta
  for key in path:gmatch("[^%.]+") do
    if value[key] == nil then
      return nil
    end
    value = value[key]
  end
  return value
end

-- Convert metadata value to inline elements
local function meta_to_inlines(value)
  if type(value) == "string" then
    -- Plain string - check if it's HTML
    if value:match("^%s*<") then
      return {pandoc.RawInline('html', value)}
    else
      return {pandoc.Str(value)}
    end
  elseif type(value) == "table" then
    if value.t == "MetaInlines" then
      -- Return the inlines directly
      return value
    elseif value.t == "MetaBlocks" then
      -- Extract inlines from blocks
      local inlines = {}
      for _, block in ipairs(value) do
        if block.content then
          for _, inline in ipairs(block.content) do
            table.insert(inlines, inline)
          end
        end
      end
      return inlines
    elseif value.t == "MetaString" then
      return {pandoc.Str(value.text)}
    elseif value[1] then
      -- It's a list/array of inlines - return them directly
      return value
    else
      -- Fallback: stringify it
      local str_value = pandoc.utils.stringify(value)
      if str_value:match("^%s*<") then
        return {pandoc.RawInline('html', str_value)}
      else
        return {pandoc.Str(str_value)}
      end
    end
  else
    return {pandoc.Str(tostring(value))}
  end
end

-- Replace %var% in a Str element, potentially returning multiple inlines
local function replace_vars_in_str(text, meta)
  local parts = {}
  local last_pos = 1

  for var_start, path, var_end in text:gmatch("()%%([%w%.]*%w)%%()") do
    -- Add text before the variable
    if var_start > last_pos then
      table.insert(parts, pandoc.Str(text:sub(last_pos, var_start - 1)))
    end

    -- Look up the variable
    local value = get_from_metadata(meta, path)
    if value then
      local inlines = meta_to_inlines(value)
      for _, inline in ipairs(inlines) do
        table.insert(parts, inline)
      end
    else
      -- Keep original if not found
      table.insert(parts, pandoc.Str("%" .. path .. "%"))
    end

    last_pos = var_end
  end

  -- Add remaining text
  if last_pos <= #text then
    table.insert(parts, pandoc.Str(text:sub(last_pos)))
  end

  return parts
end

return {
  {
    Meta = function(meta)
      metadata = meta
      return meta
    end
  },
  {
    Str = function(el)
      -- Check if this Str contains any %var% patterns
      if el.text:match("%%[%w%.]*%w%%") then
        local parts = replace_vars_in_str(el.text, metadata)
        if #parts == 1 then
          return parts[1]
        elseif #parts > 1 then
          return parts
        end
      end
    end
  }
}
