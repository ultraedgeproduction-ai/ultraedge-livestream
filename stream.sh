#!/bin/bash

STREAM_KEY="${YOUTUBE_STREAM_KEY}"

while true; do
  ffmpeg -re \
    -f lavfi -i color=c=black:s=1280x720:r=30 \
    -f lavfi -i anullsrc=r=44100:cl=stereo \
    -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='Ultra Edge Production':fontcolor=white:fontsize=60:x=(w-text_w)/2:y=(h-text_h)/2" \
    -c:v libx264 -preset veryfast -b:v 3000k \
    -c:a aac -b:a 128k \
    -f flv "rtmp://a.rtmp.youtube.com/live2/${STREAM_KEY}"
  echo "Stream ended, restarting in 5 seconds..."
  sleep 5
done
