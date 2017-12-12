#!/bin/bash

IMAGE_BOOTROM=BOOTROM.IMG
BIN_BOOTROM=bootrom.bin

IMAGE_VXWORKS=floppy.img
BIN_VXWORKS=vxWorks.st

update_bootrom()
{
	mkdir rom
	mount $IMAGE_BOOTROM rom
	cp $BIN_BOOTROM rom/bootrom.sys
	umount rom
	rm -rf rom
	echo done
}

update_vxworks()
{
	mkdir vx
	mount $IMAGE_VXWORKS vx
	cp $BIN_VXWORKS vx/
	rm -rf vx/test
	umount vx
	rm -rf vx
	echo done
}

update_bootrom
update_vxworks
