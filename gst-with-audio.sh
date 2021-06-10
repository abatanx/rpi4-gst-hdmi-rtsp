#!/bin/sh

# ---- Memo
# HDMI → MJPG(1920/1080) → RTSP 出力したいが、結局、HSV321 が 720p に縮小しているので、それであれば はなっから 720p に変換し
# 送信する。USBの転送レートと、ネットワーク転送レートを確保する。
# ----

GST_DEBUG=3 ./rtsp "
v4l2src device=/dev/video0 ! queue ! image/jpeg,width=1280,height=720,framerate=30/1  ! rtpjpegpay name=pay0 mtu=1500
alsasrc device=hw:1,0 ! queue ! audio/x-raw, format=S16LE, rate=48000, channels=2 ! audioconvert ! vorbisenc ! rtpvorbispay mtu=1500 name=pay1
"
