## Fedora
Hmmm...

### Upgrading Fedora
- <https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/>.
- <https://fedoraproject.org/security>.

```bash
dnf upgrade --refresh
reboot now
dnf system-upgrade download --releasever=43
#dnf system-upgrade reboot # Up to and including 40.
dnf5 offline reboot # 41 and above.
dnf autoremove
```

### Updates Archive
```bash
# Adds `/etc/yum.repos.d/fedora-updates-archive.repo`.
dnf install fedora-repos-archive

# Saved in `/etc/dnf/repos.override.d/99-config_manager.repo`.
dnf config-manager setopt updates-archive.enabled=0

dnf --enable-repo=updates-archive info --showduplicates kernel
```

### Batching Actions
- <https://dnf5.readthedocs.io/en/stable/commands/do.8.html>.

### DNF and APT Equivalents
- <https://docs.fedoraproject.org/en-US/quick-docs/dnf-vs-apt/>.
- Additionally, to show information about a package: `dnf info <package>` (apt: `apt-cache show <package>`).
