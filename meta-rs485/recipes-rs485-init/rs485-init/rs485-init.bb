DESCRIPTION = "Simple helloworld application"
SECTION = "examples"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://rs485_initial_port.c"

S = "${WORKDIR}"

do_compile() {
	${CC} rs485_initial_port.c -o rs485_initial_port
}

do_install() {
	install -d ${D}${bindir}
	install -m 0755 rs485_initial_port ${D}${bindir}
}

INSANE_SKIP_${PN} = "ldflags"
