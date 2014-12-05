#!/bin/sh


find ~/Git/xperia-z1f/ -name *.ko -exec cp {} ~/Git/BuildTools/msm8974_rhine/kernel_package/system/lib/modules/ \;
for file in ~/Git/BuildTools/msm8974_rhine/kernel_package/system/lib/modules/*.ko; do ~/opt/arm-gcc-linaro/bin/arm-eabi-strip --strip-debug $file; done
cd ~/Git/BuildTools/msm8974_rhine && sh doit.sh
cp ~/Git/BuildTools/msm8974_rhine/boot.img ~/Git/BuildTools/msm8974_rhine/kernel_package/boot.img
cd ~/Git/BuildTools/msm8974_rhine/kernel_package && zip -r kernel_package.zip * && mv kernel_package.zip ../
adb push ~/Git/BuildTools/msm8974_rhine/kernel_package.zip /sdcard/Download/
find ~/Git/BuildTools/msm8974_rhine/kernel_package/system/lib/modules/ -name *.ko -exec rm {} \;
