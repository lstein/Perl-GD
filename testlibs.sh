#!/bin/sh
sudo mv /usr/include/gd.h /usr/include/gd.h.orig
for d in `ls /opt/libgd/`
do
    echo perl Makefile.PL --lib_gd_path /opt/libgd/$d/lib
    perl Makefile.PL --lib_gd_path /opt/libgd/$d/lib
    make
    make test
done
sudo mv /usr/include/gd.h.orig /usr/include/gd.h
