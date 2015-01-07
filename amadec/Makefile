M_PREFIX=$(AML_LIBS_STAGING_DIR)/usr

LIB_DIR?=$(M_PREFIX)/lib
HEADERS_DIR?=$(M_PREFIX)/include

TARGET_OBJS=adec-external-ctrl.o adec-internal-mgt.o adec-ffmpeg-mgt.o adec-message.o adec-pts-mgt.o feeder.o adec_write.o adec_read.o\
           dsp/audiodsp-ctl.o audio_out/alsa-out.o audio_out/aml_resample.o audiodsp_update_format.o spdif_api.o pcmenc_api.o dts_transenc_api.o dts_enc.o audio_out/alsactl_parser.o 
TARGET=libamadec.so

INSTALL_DIR=$(LIB_DIR)/aml_libs

LDFLAGS += -shared -lpthread -lm -lasound -lrt

TOPDIR=$(shell pwd)
SRC?=$(TOPDIR)

CFLAGS+=-O2 -mlong-calls -fPIC -g
CFLAGS+=-I$(SRC) -I$(SRC)/include -I$(SRC)/../amavutils/include -I$(SRC)/../amplayer/player/include -I${HEADERS_DIR} -L${LIB_DIR}
CFLAGS+=-DALSA_OUT

ifdef DOLBY_UDC
    CFLAGS+=-DDOLBY_USE_ARMDEC
endif

export CC CFLAGS

all: $(TARGET) 

$(TARGET): $(TARGET_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(TARGET_OBJS:%.o=%.c) -o $@  

    
    

install:
	install -m 0644 libamadec.so /usr/lib/aml_libs
	install -m 0644 include/*.h /usr/include
	install -m 0644 *.h /usr/include

force:

clean:
	-rm -rf *.o ${AMADEC_DIST} ${MP3LIB} $(PCMLIB) $(ADPCMLIB) $(AACLIB) $(A52LIB)

    

