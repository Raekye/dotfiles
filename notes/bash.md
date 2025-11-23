## Bash
- Bash manual: <https://www.gnu.org/software/bash/manual/>.

### Quoting
- <https://www.gnu.org/software/bash/manual/html_node/Quoting.html>

### Arithmetic
- <https://www.gnu.org/software/bash/manual/html_node/Arithmetic-Expansion.html>
- <https://www.gnu.org/software/bash/manual/html_node/Shell-Arithmetic.html>

### Arrays
- <https://www.gnu.org/software/bash/manual/html_node/Arrays.html>

### Tilde Expansion
- <https://www.gnu.org/software/bash/manual/html_node/Tilde-Expansion.html>

### Substitution (Parameter Expansion)
- <https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html>
- Substitutions have two forms, where the variable/parameter being tested and substitution text are separated by either a "colon dash" (`:-`) or just a "dash" (`-`):
	- With the colon (`:-`), Bash tests that the parameter is _both_ set and not-null.
	- Without the colon (`-`), Bash just tests that the parameter is set.

### Grouping Commands
- <https://www.gnu.org/software/bash/manual/html_node/Command-Grouping.html>
- With subshell (see [command execution environment][command-execution-environment]): `FOO=bar; (FOO=baz; echo $FOO); echo $FOO` prints "`baz`" and "`bar`".
	- Parentheses are operators and recognized as distinct tokens, so no whitespace separation is required.
- Without subshell: `FOO=bar; { FOO=baz; echo $FOO; }; echo $FOO` prints "`baz`" twice.
	- The semicolon or a newline terminating the list of commands is required.
	- Braces are reserved words, so they must be separated by whitespace or other shell metacharacters.

### Brace Expansion
- <https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html>

### Miscellaneous
- When a process is killed by a signal, the exit code is usually(?) 128 plus the signal number.

[command-execution-environment]: https://www.gnu.org/software/bash/manual/html_node/Command-Execution-Environment.html
