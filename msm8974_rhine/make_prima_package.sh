#!/bin/sh


find ~/Git/prima/ -name *.ko -exec cp {} ~/Git/BuildTools/msm8974_rhine/prima_package/system/lib/modules/pronto/pronto_wlan.ko \;
find ~/Git/BuildTools/msm8974_rhine/prima_package/ -name *.ko -exec ~/opt/arm-gcc-linaro/bin/arm-eabi-strip --strip-debug {} \;
cp ~/Git/prima/firmware_bin/* ~/Git/BuildTools/msm8974_rhine/prima_package/system/etc/firmware/wlan/prima/
cd ~/Git/BuildTools/msm8974_rhine/prima_package && zip -r prima_package.zip * && mv prima_package.zip ../
adb push ~/Git/BuildTools/msm8974_rhine/prima_package.zip /sdcard/Download/
find ~/Git/BuildTools/msm8974_rhine/prima_package/system/lib/modules/ -name *.ko -exec rm {} \;
rm -rf ~/Git/BuildTools/msm8974_rhine/prima_package/system/etc/firmware/wlan/prima/*
