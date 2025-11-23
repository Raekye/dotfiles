## Fedora
Hmmm...

### Upgrading Fedora
- <https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/>.
- <https://fedoraproject.org/security>.

```bash
dnf upgrade --refresh
reboot now
#dnf install dnf-plugin-system-upgrade
dnf system-upgrade download --releasever=42
dnf system-upgrade reboot
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

### DNF and APT Equivalents
- <https://docs.fedoraproject.org/en-US/quick-docs/dnf-vs-apt/>.
- Additionally, to show information about a package: `dnf info <package>` (apt: `apt-cache show <package>`).
