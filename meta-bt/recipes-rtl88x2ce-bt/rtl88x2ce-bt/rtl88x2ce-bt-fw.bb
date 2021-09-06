SUMMARY = "Example of how to build an external Linux kernel module"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

#inherit module

DEPENDS += "rtl88x2ce-bt"

SRC_URI = "file://rtl88x2ce-bt.tar.bz2"

S = "${WORKDIR}/rtl88x2ce-bt/rtkbt-firmware"

do_install_append() {
#	install -d ${D}${sysconfdir}/firmware
	install -d ${D}${nonarch_base_libdir}/firmware/rtlbt
	install -m 0644 ${S}/lib/firmware/rtlbt/rtl8822cs_config ${D}/${nonarch_base_libdir}/firmware/rtlbt/
	install -m 0644 ${S}/lib/firmware/rtlbt/rtl8822cs_fw ${D}/${nonarch_base_libdir}/firmware/rtlbt/

	install -m 0644 ${S}/lib/firmware/rtl8822cu_config ${D}/${nonarch_base_libdir}/firmware/
	install -m 0644 ${S}/lib/firmware/rtl8822cu_fw ${D}/${nonarch_base_libdir}/firmware/
}

FILES_${PN} += "${nonarch_base_libdir}/firmware/rtlbt/rtl8822cs_config"
FILES_${PN} += "${nonarch_base_libdir}/firmware/rtlbt/rtl8822cs_fw"
FILES_${PN} += "${nonarch_base_libdir}/firmware/rtl8822cu_config"
FILES_${PN} += "${nonarch_base_libdir}/firmware/rtl8822cu_fw"

