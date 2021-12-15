FILESEXTRAPATHS_prepend_mx8 := "${THISDIR}/files:"

SRC_URI += "file://dfi_release_kernel_2021_09_06.patch \
			file://dfi_release_kernel_2021_09_09.patch \
			file://dfi_release_kernel_2021_09_14.patch \
			file://dfi_release_kernel_2021_11_24.patch \
			file://dfi_release_kernel_2021_11_25.patch \
			file://dfi_release_kernel_2021_12_15.patch \
"

#addtask copy_defconfig after do_patch before do_preconfigure
do_copy_defconfig_append () {
	# copy latest imx_v8_defconfig to use for mx8
	mkdir -p ${B}
	cp ${S}/arch/arm64/configs/${KERNEL_DEFCONFIG} ${B}/.config
	cp ${S}/arch/arm64/configs/${KERNEL_DEFCONFIG} ${B}/../defconfig
}
