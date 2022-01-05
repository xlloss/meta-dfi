# base on meta-imx/meta-sdk/dynamic-layers/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

do_install_append () {
    install -m 0755 ${WORKDIR}/qt5-wayland.sh ${D}${sysconfdir}/profile.d/qt5.sh
}

FILES_${PN} += "${sysconfdir}/profile.d/qt5.sh"
