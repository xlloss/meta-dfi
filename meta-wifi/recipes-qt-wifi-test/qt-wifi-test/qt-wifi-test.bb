SUMMARY = "Example of how to build an external Linux kernel module"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://wifi-test \
           file://wifi_set.sh \
          "

S = "${WORKDIR}/${PN}"

do_install() {
    install -Dm 0755 ${WORKDIR}/wifi-test  ${D}${bindir}/wifi-test
    install -Dm 0755 ${WORKDIR}/wifi_set.sh  ${D}${bindir}/wifi_set.sh
}

INSANE_SKIP_${PN} += "file-rdeps"
RDEPENDS_${PN} += "wifi-test qtbase wifi_set.sh"
RPROVIDES_${PN} += "wifi-test qtbase wifi_set.sh"
