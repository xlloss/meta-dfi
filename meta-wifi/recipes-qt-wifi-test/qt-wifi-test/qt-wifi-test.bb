SUMMARY = "Example of how to build an external Linux kernel module"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://wifi-test"

S = "${WORKDIR}/${PN}"

do_install() {
    install -Dm 0755 ${WORKDIR}/wifi-test  ${D}${bindir}/wifi-test
}

INSANE_SKIP_${PN} += "file-rdeps"
RDEPENDS_${PN} += "wifi-test qtbase"
RPROVIDES_${PN} += "wifi-test qtbase"
