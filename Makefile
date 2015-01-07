all:
	make -C amavutils
	make -C amadec
	make -C amcodec
	
install:
	mkdir -p /usr/lib/aml_libs
	make -C amavutils install
	make -C amadec install
	make -C amcodec install
	install -m 0666 ld.so.conf /usr/lib/aml_libs
	install -m 0666 aml.conf /etc/ld.so.conf.d
                
clean:
	make -C amavutils clean
	make -C amadec clean
	make -C amcodec clean                        
