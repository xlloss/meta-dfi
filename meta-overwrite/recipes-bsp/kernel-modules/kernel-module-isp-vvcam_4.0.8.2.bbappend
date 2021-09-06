FILESEXTRAPATHS_prepend_mx8 := "${THISDIR}/files:"

SRC_URI = " \
    ${ISP_KERNEL_SRC};branch=${SRCBRANCH} \
    file://0001-disable-CSI_SENSOR_KERNEL-define-to-avoid-reinstall-.patch \
"

S = "${WORKDIR}/git/vvcam/common"

do_patch() {
       cd ${WORKDIR}/git/
       cp -a ${WORKDIR}/0001-disable-CSI_SENSOR_KERNEL-define-to-avoid-reinstall-.patch ./
       patch -p1 < 0001-disable-CSI_SENSOR_KERNEL-define-to-avoid-reinstall-.patch
}

inherit module
