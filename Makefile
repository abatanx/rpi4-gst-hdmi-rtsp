#
# RTSP
#

PACKAGES=gstreamer-1.0 glib-2.0 gstreamer-rtsp-server-1.0
CFLAGS=-g -Wall -Wextra `pkg-config --cflags $(PACKAGES)`
LIBS=`pkg-config --libs $(PACKAGES)`

all		:	rtsp.o
	echo $(LIBS)
	gcc -o rtsp rtsp.o $(LIBS)

rtsp.o	:	rtsp.c
	gcc -c $(CFLAGS) -o rtsp.o rtsp.c

