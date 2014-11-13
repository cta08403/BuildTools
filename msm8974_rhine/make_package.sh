#!/bin/sh

find ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package/system/lib/modules/ -name *.ko -exec rm {} \;
find ~/Git/xperia-z1f/ -name *.ko -exec cp {} ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package/system/lib/modules/ \;
for file in ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package/system/lib/modules/*.ko; do ~/opt/arm-gcc-linaro/bin/arm-eabi-strip --strip-debug $file; done
mv ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package/system/lib/modules/wlan.ko ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package/system/lib/modules/pronto/pronto_wlan.ko
rm -rf ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package/system/etc/firmware/wlan/prima/*
cp ~/Git/xperia-z1f/drivers/staging/prima/firmware_bin/* ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package/system/etc/firmware/wlan/prima/
cd ~/Downloads/BuildTools/msm8974_rhine && sh doit.sh
cp ~/Downloads/BuildTools/msm8974_rhine/boot.img ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package/boot.img
cd ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package && zip -r Kernel_Package.zip * && mv Kernel_Package.zip ../
adb push ~/Downloads/BuildTools/msm8974_rhine/Kernel_Package.zip /sdcard/Download/
