FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://profile \
            file://save-touch-cali.sh \
            file://do_touch_cali.sh \
            file://qtanimation.sh \
            file://qtclock.sh \
            file://qtcube.sh \
            file://qtdemo.sh \
            file://qtopengl.sh \
            file://browser.sh \
            file://icon-3d.png \
            file://icon-animation.png \
            file://icon-clock.png \
            file://icon-cube.png \
            file://icon-demo.png \
            file://icon-touchscreen.png \
            file://icon-browser.png \
            file://icon-poweroff.png \
            file://icon-reboot.png \
            file://penguin.png \
            "

SRC_URI_append_mx8dx = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', ' file://weston.config', '', d)}"

# To customize weston.ini, start by setting the desired assignment in weston.ini,
# commented out. For example:
#     #xwayland=true
# Then add the assignment to INI_UNCOMMENT_ASSIGNMENTS.
#INI_UNCOMMENT_ASSIGNMENTS_append_mx8mp = "use-g2d=1"

do_install_append() {
    install -Dm0755 ${WORKDIR}/profile ${D}${sysconfdir}/profile.d/weston.sh
    install -Dm 0755 ${WORKDIR}/save-touch-cali.sh  ${D}${bindir}/save-touch-cali.sh
    install -Dm 0755 ${WORKDIR}/do_touch_cali.sh  ${D}${bindir}/do_touch_cali.sh
    install -Dm 0755 ${WORKDIR}/qtanimation.sh  ${D}${bindir}/qtanimation.sh
    install -Dm 0755 ${WORKDIR}/qtclock.sh  ${D}${bindir}/qtclock.sh
    install -Dm 0755 ${WORKDIR}/qtcube.sh  ${D}${bindir}/qtcube.sh
    install -Dm 0755 ${WORKDIR}/qtdemo.sh  ${D}${bindir}/qtdemo.sh
    install -Dm 0755 ${WORKDIR}/qtopengl.sh  ${D}${bindir}/qtopengl.sh
    install -Dm 0755 ${WORKDIR}/browser.sh  ${D}${bindir}/browser.sh
    install -Dm 0644 ${WORKDIR}/icon-3d.png  ${D}${datadir}/weston/icon-3d.png
    install -Dm 0644 ${WORKDIR}/icon-animation.png  ${D}${datadir}/weston/icon-animation.png
    install -Dm 0644 ${WORKDIR}/icon-clock.png  ${D}${datadir}/weston/icon-clock.png
    install -Dm 0644 ${WORKDIR}/icon-cube.png  ${D}${datadir}/weston/icon-cube.png
    install -Dm 0644 ${WORKDIR}/icon-demo.png  ${D}${datadir}/weston/icon-demo.png
    install -Dm 0644 ${WORKDIR}/icon-touchscreen.png  ${D}${datadir}/weston/icon-touchscreen.png
    install -Dm 0644 ${WORKDIR}/penguin.png  ${D}${datadir}/weston/penguin.png
    install -Dm 0644 ${WORKDIR}/icon-browser.png  ${D}${datadir}/weston/icon-browser.png
    install -Dm 0644 ${WORKDIR}/icon-poweroff.png  ${D}${datadir}/weston/icon-poweroff.png
    install -Dm 0644 ${WORKDIR}/icon-reboot.png  ${D}${datadir}/weston/icon-reboot.png

}

FILES_${PN} += "${datadir}/*"

RDEPENDS_${PN} += "bash"
RPROVIDES_${PN} += "save-touch-cali.sh do_touch_cali.sh qtanimation.sh qtclock.sh qtcube.sh qtdemo.sh"
RDEPENDS_${PN} += "save-touch-cali.sh do_touch_cali.sh qtanimation.sh qtclock.sh qtcube.sh qtdemo.sh"
RPROVIDES_${PN} += "icon-3d.png icon-animation.png icon-clock.png icon-cube.png icon-demo.png icon-touchscreen.png penguin.png"
RDEPENDS_${PN} += "icon-3d.png icon-animation.png icon-clock.png icon-cube.png icon-demo.png icon-touchscreen.png penguin.png"
RPROVIDES_${PN} += "icon-browser.png browser.sh icon-poweroff.png icon-reboot.png"
RDEPENDS_${PN} += "icon-browser.png browser.sh icon-poweroff.png icon-reboot.png"
