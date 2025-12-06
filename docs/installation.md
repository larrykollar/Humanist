# Installing the Humanist Publishing System

For a lone writer, use the top-level `INSTALL` script.
It moves the contents of both `scripts` and `pandoc_scripts`
where they need to be.
It copies the other scripts to the user's `bin` directory
(Ubuntu-based Linux systems already include that in the PATH;
you may need to update your own PATH otherwise).

For a larger group,
put both general scripts and Pandoc filter and templates
in a shared drive,
and give instructions to the team
for setting both Pandoc and execution paths.

**Tip**: Windows users using WSL or Cygwin can link the WSL `Documents` directory
to the Windows `Documents` directory using the command:

    ln -s /mnt/c/users/yourname/Documents Documents

So in your WSL shell, `cd ~/Documents` takes you to the Documents folder
in your native Windows system.
This allows you to do your editing and housekeeping in Windows,
if you prefer,
and perform all processing in the WSL shell.
You can use the same linkage under Cygwin,
although the paths may differ slightly.

For best results, make sure your editor
sets LF-only line endings for content.
