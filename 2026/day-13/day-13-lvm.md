# Day 13 – Linux LVM Practice

## Goal

Today I practiced Linux Logical Volume Management (LVM) to understand how flexible storage works. The focus was on creating safe storage, formatting it, mounting it, and extending it — just like real server environments.

---

## What I Did

* Created a virtual disk file to safely simulate a new storage device
* Converted that disk into an LVM Physical Volume
* Built a Volume Group to act as a storage pool
* Created a Logical Volume for usable storage
* Formatted the volume with an ext4 filesystem
* Mounted the storage to make it accessible
* Extended the volume and resized the filesystem

---

## Commands Used

* `dd` – create virtual disk
* `losetup` – attach loop device
* `pvcreate` – create physical volume
* `vgcreate` – create volume group
* `lvcreate` – create logical volume
* `mkfs.ext4` – format filesystem
* `mount` – attach storage
* `lvextend` – expand volume
* `resize2fs` – resize filesystem
* `df -h` – verify storage

---

## What I Learned

* LVM allows storage to grow dynamically without breaking the system
* Filesystem formatting is required before mounting storage
* Extending storage requires resizing the filesystem to use new space

---

## Key Takeaway

LVM provides flexible, production-style storage management. Practicing with loop devices is a safe way to build real confidence without risking system disks.
