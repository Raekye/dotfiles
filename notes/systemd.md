## `systemd`
```bash
# Logs since the most recent boot (i.e. the current one).
journalctl --boot=0
journalctl --boot=-0
journalctl -b 0
journalctl -b

# Logs since the previous boot.
journalctl --boot=-1

# Logs since the first recorded boot.
journalctl --boot=1

# Show only kernel messages (implies `-b`).
journalctl --dmesg
journalctl -k

# Show most recent 10 entries.
journalctl --lines=10
journalctl -n 10
journalctl --lines # The default value is 10 if no argument is given.

# Show oldest 10 entries.
journalctl --lines=+10

# Show most recent entries, and continuously print new entries (implies `-n`).
journalctl --follow
journalctl -f

# Jump to pager end (implies `-n1000` to avoid unbounded buffering).
journalctl --pager-end
journalctl -e
```

### Basic Syntax
- Configuration entries are written as `key=value`; <q>whitespace immediately before or after the "`=`" is ignored</q>.
- <q>Empty lines and lines starting with "`#`" or "`;`" are ignored</q>.
	In particular, comments cannot be started mid-line.
- <q>Lines ending in a backslash are concatenated with the following line while reading and the backslash is replaced by a space character</q>.

Sources:
- `man systemd.syntax`: <https://www.freedesktop.org/software/systemd/man/latest/systemd.syntax.html>.

#### Quoting
- Only applies to settings where quoting is allowed.
- Single and double quotes are equivalent.
- <q>The opening quote may appear only at the beginning or after whitespace that is not quoted, and the closing quote must be followed by whitespace or the end of line</q>.
- The enclosed text becomes part of the same item.
- <q>Quotes themselves are removed</q>.
- <q>C-style escapes are supported</q> (e.g. `\\n`); <q>unknown patterns will result in a warning</q>.

Sources:
- `man systemd.syntax` under "Quoting": <https://www.freedesktop.org/software/systemd/man/latest/systemd.syntax.html#Quoting>.

#### Command Lines
- Applies to `ExecStart=` and similar.
- Does **not** implicitly invoke a shell; parsing is performed by systemd.
- Executable can be a simple file name (without slashes) if it resides in `systemd-path search-binaries-default`.
- <q>An argument solely consisting of "`;`" must be escaped, i.e. specified as "`\\;`"</q>.

Sources:
- `man systemd.service` under "Command Lines": <https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html#Command%20lines>.

#### Parsing
1. [Specifiers][specifiers] (e.g. `%h`) <q>are replaced when the unit files are loaded.
2. <q>For settings where quoting is allowed</q>, quotes are processed and "unquoted" as in [quoting][#quoting].
3. Where applicable, environment variables are expanded; in the case of command lines, for each item (i.e. argument):
	- if the argument contains an identifier enclosed with curly braces, e.g. `${FOO}`,
		then the variable is expanded into the same token; i.e. <q>always resulting in exactly a single argument</q>;
	- if the argument is exactly a dollar sign followed by an identifier, e.g. `$FOO`,
		then the variable is expanded **and further split on whitespace**, <q>resulting in zero or more arguments</q>.
		<q>For this type of expansion, quotes are respected when splitting into words, and afterwards removed</q>.

In particular:
- `$FOO` and `"$FOO"` are always equivalent, and do not ensure that the expansion of `$FOO` will be passed as a single argument,
	since unquoting happens before and separate from environment variable expansion.
- If a specifier expands to contain quotes or environment variables, those will be processed as if the user wrote the expansion,
	since specifiers are expanded when the unit file is loaded.

See also:
- [`specifier_printf`][specifier-printf]: the function that performs the specifier replacement.
- [`replace_env_argv`][replace-env-argv]: the function that expands environment variables.

#### Examples
- See examples in [notes/systemd](systemd/).

##### Example: backslash escapes
```systemd
[Unit]
Description=Example: backslash escapes

[Service]
Type=oneshot
# By default, `echo` does not interpret backslash escapes; we will see "exactly what `echo` sees".
ExecStart=echo . [\\n] . [\n] .

[Install]
WantedBy=default.target
```

Outputs:

```
. [\n] . [
] .
```

##### Example: environment variables
```systemd
[Unit]
Description=Example: environment variables

[Service]
Type=oneshot
Environment="FOO='one two' three"
ExecStart=echo == $$FOO
ExecStart=printf [%%s]\\n $FOO
ExecStart=echo == \"$$FOO\"
ExecStart=printf [%%s]\\n "$FOO"
ExecStart=echo == $${FOO}
ExecStart=printf [%%s]\\n ${FOO}

[Install]
WantedBy=default.target
```

Outputs:

```
== $FOO
[one two]
[three]
== "$FOO"
[one two]
[three]
== ${FOO}
['one two' three]
```

##### Example: specifier expansion
```bash
useradd --home-dir='/home/${USER}' someone
```

```systemd
[Unit]
Description=Example: specifier expansion

[Service]
Type=oneshot
ExecStart=echo ${HOME}
ExecStart=echo ${USER}
# Specifier replaced with `/home/${USER}` at load time, `${USER}` further substituted before execution.
ExecStart=echo %h

[Install]
WantedBy=default.target
```

Outputs:

```
/home/${USER}
someone
/home/someone
```

### Units
- [Load paths](https://www.freedesktop.org/software/systemd/man/systemd.unit.html#Unit%20File%20Load%20Path).
- [Specifiers (special variables)](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Specifiers).

#### Dependencies
- [`Before=` and `After=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Before=)
- [`Requires=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Requires=)
- [`Wants=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Wants=)
- [Properties and their inverses](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Mapping%20of%20unit%20properties%20to%20their%20inverses).

`Requires=` and `Wants=` affect unit activation; when a dependant is started, its dependencies are also started.

`Before=` and `After=` affect unit activation ordering; when both a dependant and a dependency is started together,
the dependant's startup is delayed until its dependency has finished starting up.

With only `Requires=`/`Wants=`, starting `dependant.service` "autostarts" `dependency.service` (if not already running),
but they may start concurrently.
With only `Before=`/`After=`, starting `dependant.service` doesn't automatically start `dependency.service`,
but if they are being started together, `dependant.service` will be started after `dependency.service`.

With `Requires=` and an ordering dependency, if `dependency.service` fails, `dependant.service` won't be started.

### Services
- [`Type=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html#Type=).
- [`ExecStart=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html#ExecStart=).
- [`Restart=` (including table of restarting conditions)](https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html#Restart=).
- [Command line parsing, and variable/specifier expansions](https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html#Command%20lines).

### Exec
- [User/Group](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#User/Group%20Identity).
- [Logging](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#Logging%20and%20Standard%20Input/Output).
- [Setting environment variables](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#Environment).
- [Environment variables set or propagated by the service manager](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#Environment%20Variables%20Set%20or%20Propagated%20by%20the%20Service%20Manager).
- [`WorkingDirectory=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#WorkingDirectory=).

### Other
- [Targets](https://www.freedesktop.org/software/systemd/man/latest/systemd.target.html).
- [Special units](https://www.freedesktop.org/software/systemd/man/latest/systemd.special.html).
- [Syntax](https://www.freedesktop.org/software/systemd/man/latest/systemd.syntax.html).
- [Running Services After the Network is Up](https://systemd.io/NETWORK_ONLINE/).

### Other Quirks
- Unless a process specifically logs to journald (i.e. not simply the default behaviour of piping a service's standard streams to journald's logging helper),
	trailing whitespace is removed and empty lines are dropped (<https://www.freedesktop.org/software/systemd/man/latest/sd_journal_print.html>).
- `SuccessExitStatus=` ([doc](https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html#SuccessExitStatus=))
	does not affect the naming in `systemctl status` output (<https://github.com/systemd/systemd/issues/15757>).

[specifiers]: https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Specifiers
[specifier-printf]: https://github.com/systemd/systemd/blob/v257.9/src/shared/specifier.c#L37
[replace-env-argv]: https://github.com/systemd/systemd/blob/v257.9/src/basic/env-util.c#L888
