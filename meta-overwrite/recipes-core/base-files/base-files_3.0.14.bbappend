FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


SRC_URI += "file://issue file://issue.net "

do_install_append () {
	install -m 0644 ${WORKDIR}/issue  ${D}${sysconfdir}/
	echo "Yocto ${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue

	install -m 0644 ${WORKDIR}/issue.net  ${D}${sysconfdir}/
	echo "Yocto ${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
}
