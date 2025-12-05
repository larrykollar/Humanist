<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" />
<xsl:strip-space elements="bookmap map booktitle bookmeta frontmatter backmatter reltable" />

<!-- DITAmap to Humanist book file
    V1.0, 2025 25 Nov by Larry Kollar

    We're interested mostly in the chapter & topicref entries.
    This version is nowhere near perfect, but does more or less
    structure the output enough so we can fix it.
-->

<xsl:template match="bookmap|map">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="chapter|appendix">
  <xsl:value-of select="@href" />
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="topicref">
  <xsl:param name="depth" select="count(ancestor::topicref)" />
  <xsl:value-of select="substring('&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;&#x09;', 1, depth)"/><xsl:value-of select="@href" />
  <xsl:apply-templates />
</xsl:template>

<!-- throw everything else away -->
<xsl:template match="*"/>

</xsl:stylesheet>
