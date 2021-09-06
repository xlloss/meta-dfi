SUMMARY = "tinycompress library for compress audio offload in alsa"
DESCRIPTION = "A library to handle compressed formats like MP3 etc"
LICENSE = "BSD-3-Clause"

inherit autotools pkgconfig
LIC_FILES_CHKSUM = "file://COPYING;md5=cf9105c1a2d4405cbe04bbe3367373a0"

SRC_URI = "https://github.com/alsa-project/tinycompress/archive/refs/tags/v1.1.6.tar.gz \
           file://0001-tinycompress-Add-id3-decoding.patch \
"
S = "${WORKDIR}/tinycompress-1.1.6"
SRC_URI[md5sum] = "815da47cfc8d1432bba99b6b2c4a2ada"
SRC_URI[sha256sum] = "2cb5ad8d27a5a8896904a31fec99d91fde251bcbeb620b60e75a7bd49e6d9abd"
