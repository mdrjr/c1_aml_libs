PREFIX=$(AML_LIBS_STAGING_DIR)/usr

LIB_DIR?=$(PREFIX)/lib
HEADERS_DIR?=$(PREFIX)/include
CROSS=$(CC:%gcc=%)
QUITE_CMD=1

INSTALL_FLAGS=-m 755

CPP=g++
AS=as
AR=ar
LD=ld
NM=nm
STRIP=strip
OBJCOPY=objcopy
export CC CPP AS AR LD NM STRIP OBJCOPY

TOPDIR=$(shell pwd)
SRC?=$(TOPDIR)
SRCTREE=$(SRC)
BUILDTREE=$(SRC)/out

INSTALL_DIR=${LIB_DIR}/aml_libs

TARGET?=libamcodec.so

DIRS=audio_ctl/ codec/

LDFLAGS=  -O2  -L$(LIB_DIR)  -lm -lc  -shared -Wl,--shared -Wl,-soname,$(TARGET)$(LIB_VERSION)

#INCLUDE=$(DIRS:%/=-I$(SRC)/%/include)
INCLUDE=${SRCTREE}/include/ 
#CFLAGS=-O0  -gdwarf-2  -g
CFLAGS=-O2 -g  -I$(SRC)/include  -I${SRCTREE}/audio_ctl -I${SRCTREE}/codec -I${SRCTREE}/../amadec/include -fPIC




target_all=  $(TARGET)
all:$(target_all)

dirs=$(DIRS)

DIROBJ=$(dirs:%/=%-dir)


$(target_all):$(DIROBJ)
	$(call ld_mk,$(OUT_DIR)$@,$^)




include $(SRCTREE)/rules.mk
export CC CPP AS AR LD TOPDIR SRCTREE  CFLAGS LDFLAGS Q

CLRDIR=$(dirs:%/=%-clrdir)
clean:$(CLRDIR)
	rm -rf $(target_all)

install:
	install  -m 0644 libamcodec.so $(DESTDIR)/usr/lib/aml_libs
	
	install -m 0644 include -d $(DESTDIR)/usr/include/amcodec
	install -m 0644 include/*.h $(DESTDIR)/usr/include/amcodec
	install -m 0644 include/*.h $(DESTDIR)/usr/include
	
	install -m 0644 include/amports -d $(DESTDIR)/usr/include/amports
	install -m 0644 include/amports/*.h $(DESTDIR)/usr/include/amports
	
	install -m 0644 include/ppmgr -d $(DESTDIR)/usr/include/ppmgr
	install -m 0644 include/ppmgr/*.h $(DESTDIR)/usr/include/ppmgr

