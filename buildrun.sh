#!/bin/sh

Script=${0##*/}

function usage
{
   echo "usage: $Script [-f]"
   exit 1
}

while test $# -gt 0; do
	case $1 in
	-f)
		rm -rf .unikraft/build;
		rm -rf _build;
		shift;;
	 *)
		usage;;
	esac
done

mykraftbuild && \
qemu-system-x86_64 -m 2G --enable-kvm -nographic -kernel .unikraft/build/helloocaml_qemu-x86_64
