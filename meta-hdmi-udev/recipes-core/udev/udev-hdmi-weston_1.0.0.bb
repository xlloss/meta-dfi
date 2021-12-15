DESCRIPTION = "udev Rules For M8MP553"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://99-weston-hdmi.rules file://weston_restart.sh "


S = "${WORKDIR}"

do_install () {
	install -d ${D}${sysconfdir}/udev/rules.d
	install -d ${D}${sysconfdir}/udev/scripts
	install -m 0644 ${WORKDIR}/99-weston-hdmi.rules ${D}${sysconfdir}/udev/rules.d/
	install -m 0755 ${WORKDIR}/weston_restart.sh ${D}${sysconfdir}/udev/scripts/
}

#RDEPENDS = "99-weston-hdmi.rules weston_restart.sh"
#RDEPENDS_${PN} += "99-weston-hdmi.rules"
#RDEPENDS_${PN} += "weston_restart.sh"

RDEPENDS_${PN} += "bash"

RPROVIDES_${PN} += "99-weston-hdmi.rules "
RPROVIDES_${PN} += "weston_restart.sh "

RDEPENDS_${PN} += "99-weston-hdmi.rules "
RDEPENDS_${PN} += "weston_restart.sh "
