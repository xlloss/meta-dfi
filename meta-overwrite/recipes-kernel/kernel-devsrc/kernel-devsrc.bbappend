do_install_append() {
	if [ -d arch/${ARCH}/include/generated ]; then
	    cp -a --parents arch/${ARCH}/include/generated $kerneldir/build/
	fi
}
