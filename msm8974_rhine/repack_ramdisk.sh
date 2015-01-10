#!/bin/sh

cd $1/ && find . | cpio -o -H newc | gzip > ../$1.cpio.gz
