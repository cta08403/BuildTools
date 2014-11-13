#!/bin/sh

rm -f ~/Downloads/BuildTools/msm8974_rhine/zImage
KERNEL_SRC_PATH=/home/tung/Git/xperia-z1f
./mkqcdtbootimg --kernel $KERNEL_SRC_PATH/arch/arm/boot/zImage --ramdisk ramdisk.cpio.gz --base 0x00000000 \
              --ramdisk_offset 0x02000000 --tags_offset 0x01E00000 --pagesize 2048 \
              --cmdline "androidboot.hardware=qcom user_debug=31 maxcpus=2 msm_rtb.filter=0x3F ehci-hcd.park=3 msm_rtb.enable=0 lpj=192598 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y" \
              --dt_dir $KERNEL_SRC_PATH/arch/arm/boot/ -o boot.img      