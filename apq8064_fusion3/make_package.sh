#!/bin/sh

find ~/Downloads/BuildTools/files/Kernel_Package/system/lib/modules/ -name *.ko -exec rm {} \;
find ~/Git/xperia-zr/ -name *.ko -exec cp {} ~/Downloads/BuildTools/files/Kernel_Package/system/lib/modules/ \;
for file in ~/Downloads/BuildTools/files/Kernel_Package/system/lib/modules/*.ko; do ~/opt/arm-gcc-linaro/bin/arm-eabi-strip --strip-debug $file; done
mv ~/Downloads/BuildTools/files/Kernel_Package/system/lib/modules/wlan.ko ~/Downloads/BuildTools/files/Kernel_Package/system/lib/modules/prima/prima_wlan.ko
rm -rf ~/Downloads/BuildTools/files/Kernel_Package/system/etc/firmware/wlan/prima/*
cp ~/Git/xperia-zr/drivers/staging/prima/firmware_bin/* ~/Downloads/BuildTools/files/Kernel_Package/system/etc/firmware/wlan/prima/
cd ~/Downloads/BuildTools/files && sh doit.sh
cp ~/Downloads/BuildTools/files/boot.img ~/Downloads/BuildTools/files/Kernel_Package/boot.img
cd ~/Downloads/BuildTools/files/Kernel_Package && zip -r Kernel_Package.zip * && mv Kernel_Package.zip ../
adb push ~/Downloads/BuildTools/files/Kernel_Package.zip /external_sd/Download/