FROM alpine:latest

# تنصيب الأدوات اللازمة
RUN apk add --no-cache ffmpeg bash

# كود البث مع إعادة محاولة تلقائية
CMD while true; do \
    ffmpeg -re -i "https://shrine.karbala.tv/live/st1/playlist.m3u8" \
    -c:v libx264 -preset ultrafast -b:v 400k -maxrate 400k -bufsize 800k \
    -c:a aac -b:a 128k -ar 44100 \
    -f flv "rtmp://a.rtmp.youtube.com/live2/q12g-s6wc-0y03-0ua5-6e6p"; \
    echo "البث فصل.. جاري إعادة الاتصال خلال 5 ثواني..."; \
    sleep 5; \
    done
    
