all:
	cd kernel/; rm -rf limine 2> /dev/null; make clean; bash buildall.sh
	cd kernel/; bash build.sh; mv TRVOS.iso ../
	@ rm $$(find ./ -type f -name "*.d")
	@ rm $$(find ./ -type f -name "*.o")

reset:
	cd kernel/; make clean; rm -rf limine
	@ rm $$(find ./ -type f -name "*.d")
	@ rm $$(find ./ -type f -name "*.o")



run:
	qemu-system-x86_64 -cdrom TRVOS.iso -monitor stdio

runfs:
	qemu-system-x86_64 -cdrom TRVOS.iso -full-screen
