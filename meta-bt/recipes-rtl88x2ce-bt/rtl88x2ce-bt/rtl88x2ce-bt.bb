SUMMARY = "Example of how to build an external Linux kernel module"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit module

SRC_URI = "file://rtl88x2ce-bt.tar.bz2"

S = "${WORKDIR}/${PN}/bluetooth_usb_driver"

# The inherit of module.bbclass will automatically name module packages with
# "kernel-module-" prefix as required by the oe-core build environment.
#
RPROVIDES_${PN} += "kernel-module-rtl88x2ce-bt"
