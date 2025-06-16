## Package Managers
- [DNF and APT command equivalents](https://docs.fedoraproject.org/en-US/quick-docs/dnf-vs-apt/).

	Additionally, to show information about a package: `dnf info <package>` or `apt-cache show <package>`.

### `dnf`
- [Upgrading Fedora Using DNF System Plugin](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/).
	- [Fedora PGP Keys](https://fedoraproject.org/security).

	```bash
	dnf upgrade --refresh
	reboot now
	#dnf install dnf-plugin-system-upgrade
	dnf system-upgrade download --releasever=42
	dnf system-upgrade reboot
	dnf autoremove
	```
