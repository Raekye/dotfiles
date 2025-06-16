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

### Units
- [Load paths](https://www.freedesktop.org/software/systemd/man/systemd.unit.html#Unit%20File%20Load%20Path).
- [Specifiers (special variables)](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Specifiers).
- [Properties and their inverses](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Mapping%20of%20unit%20properties%20to%20their%20inverses).

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
