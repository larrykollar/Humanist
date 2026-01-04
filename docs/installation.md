# Installing the Humanist Publishing System

For a lone writer, use the top-level `INSTALL` script.
It copies the contents of both `scripts` and `pandoc_scripts`
to where they need to be.
It copies the other scripts to the user's `bin` directory
(Ubuntu-based Linux systems already include that in the PATH;
you may need to update your own PATH otherwise).

For a team of writers, maintaining the system
is easier if you:

* put both general scripts and Pandoc filter and templates
  in a shared drive
* modify the *humanist* script to point to the correct
  filter and template locations
* give instructions to the team for setting execution paths

**Tip**: Windows users using WSL or Cygwin
can link their `Documents` directory
to the Windows `Documents` directory.
In WSL, use the command:

    ln -s /mnt/c/users/yourname/Documents Documents

In Cygwin, use the command:

    ln -s /cygdrive/c/users/yourname/Documents Documents

After linking, `cd ~/Documents` takes you
to the Documents folder in your native Windows system.
This allows you to do your editing and housekeeping in Windows,
if you prefer,
and perform all processing in the WSL or Cygwin shell.

For best results, make sure your editor
sets LF-only line endings for content.
