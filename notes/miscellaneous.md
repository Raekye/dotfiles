## Package Managers
- [DNF and APT command equivalents](https://docs.fedoraproject.org/en-US/quick-docs/dnf-vs-apt/).

	Additionally, to show information about a package: `dnf info <package>` or `apt-cache show <package>`.

### `dnf`
- [Upgrading Fedora Using DNF System Plugin](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/).
	- [Fedora PGP Keys](https://fedoraproject.org/security).

	```
	dnf upgrade --refresh
	reboot now
	dnf install dnf-plugin-system-upgrade
	dnf system-upgrade download --releasever=39
	dnf autoremove
	```

## Firefox
### Firefox Auto-Downloads Files
- [Since release 98.0](https://www.mozilla.org/en-US/firefox/98.0/releasenotes/).
	- [Longer explanation](https://support.mozilla.org/en-US/kb/manage-downloads-preferences-using-downloads-menu).
- [Please stop doing this](https://connect.mozilla.org/t5/ideas/choose-to-always-ask-to-download-files-instead-of-auto/idi-p/958).

In "Settings" -> "General" (`about:preferences`), under "Files and Applications", you may have "Always ask you where to save files" checked.
However, Firefox may still download files, such as PDFs, without asking.

My understanding of the problem is that Firefox thinks "opening files" and "saving files" are completely separate.

Just a bit further below, under "Applications", Firefox can have custom "Action"s for different "Content Type"s;
for example, (I believe) by default, PDFs are set to "Open in Firefox".
When you "download" a PDF, Firefox thinks it should "just" "open" it, so it auto-downloads the file, and opens it.

If you change the action to "Save File", Firefox will actually ask you where to save it
(assuming you have checked "Always ask you where to save files" as mentioned above).

Note that the setting "What should Firefox do with other files?" (where the options are "Save files" and "Ask whether to open or save files")
is orthogonal to "Always ask you where to save files";
"Always ask you where to save files" applies _after_ Firefox has decided that it is only saving the file.

Also, as part of release 98.0, such auto-downloaded files will no-longer be put in a proper temp folder.

> Any files you download will be immediately saved on your disk.
> Depending on the current configuration, they’ll be saved in your preferred download folder, or you’ll be asked to select a location for each download.
> Windows and Linux users will find their downloaded files in the destination folder.
> They’ll no longer be put in the Temp folder.
> - https://www.mozilla.org/en-US/firefox/98.0/releasenotes/

To make Firefox download such files into a proper temp folder again, the `about:config` setting `browser.download.start_downloads_in_tmp_dir` can be used
([beta 102.0 release notes](https://www.mozilla.org/en-US/firefox/102.0beta/releasenotes/)).

## `systemd`
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

## Other References
- [GNU `make` automatic variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html).
- [Trailing slashes on GNU programs](https://www.gnu.org/software/coreutils/manual/html_node/Trailing-slashes.html).
- [Bash quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html).

## Specifications
- [freedesktop.org](https://www.freedesktop.org/wiki/Specifications/).
- [`systemd` file hierarchy](https://www.freedesktop.org/software/systemd/man/file-hierarchy.html).
- [Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/fhs.shtml) ([Wikipedia](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)).
