## Filesystems and Storage Devices
### GNU Parted
- Supports/uses both base 10 (e.g. "GB") and base 2 (e.g. "GiB") units; can be set with the `unit` command ([online manual][parted-unit]).
- `resizepart` can be used to change the end position of a partition ([online manual][parted-resizepart]).

### Logical Volume Manager (LVM)
- For `lvextend`, input units are always base 2 (regardless of capitalization).
	For output (`--units` on other commands), capital letters indicate base 10 units.
	Source: [man page][lvm-lvextend-units].

### QEMU Images
- `qemu-img` seems to always use base 2 units. Source: [man page][qemu-img-size] (under "Command parameters:").

### After Resizing a QEMU Disk Image
- Resize the partition.
- Reboot.
- On LVM systems:
	- run `pvresize /dev/<partition>`;
	- `pvs` and `vgs` should display the updated size;
	- `lvextend --size [+]<size>[unit] <LV>` to grow the logical volume.
- Resize the filesystem: e.g. `resize2fs <device>` (for ext2/ext3/ext4), or `xfs_growfs <mount point or device>` (for XFS).
- Verify: `df --human-readable # -h for short` (base 2 units) or `df --si # -H for short` (base 10 units).

### Filesystem-Independent Mount Options
Source: [man page][mount-manual] (under "Filesystem-Independent Mount Options").

- `noatime`: disables all updates to access time (implies `nodiratime`).
- `relatime`: access time is only updated if the previous access time was earlier than the current modify or change time,
	or if the last access time is more than 1 day old.
- `strictatime`: access time is always updated.
- `lazyatime`: only update the in-memory times (access, modify, and change);
	the on-disk timestamps are updated under specific conditions (e.g. upon `fsync`).

The modify time indicates the last time the file contents were modified.
The change time indicates the last time the file's metadata was changed.

[parted-unit]: https://www.gnu.org/software/parted/manual/html_node/unit.html
[parted-resizepart]: https://www.gnu.org/software/parted/manual/html_node/resizepart.html

[lvm-lvextend-units]: https://man.archlinux.org/man/lvextend.8#Size

[qemu-img-size]: https://www.qemu.org/docs/master/tools/qemu-img.html

[mount-manual]: https://man.archlinux.org/man/mount.8
