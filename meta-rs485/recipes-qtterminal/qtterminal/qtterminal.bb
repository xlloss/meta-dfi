DESCRIPTION = "Qt Terminal"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


FILESEXTRAPATHS_append := "${THISDIR}/files:"

SRC_URI = " file://qt-terminal "


S = "${WORKDIR}"

do_install () {
	install -d ${D}${bindir}
	install -m 0755 ${WORKDIR}/qt-terminal ${D}${bindir}
}



RPROVIDES_${PN} += "qt-terminal "

RDEPENDS_${PN} += "qt-terminal qtbase qtserialport qtserialbus"
