FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev unzip ffmpeg wget zlib1g zlib1g-dev libssl-dev

RUN wget http://nginx.org/download/nginx-1.14.0.tar.gz
RUN wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
RUN tar -zxvf nginx-1.14.0.tar.gz
RUN unzip master.zip
RUN cd nginx-1.14.0/ && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master && make && make install
RUN wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
RUN chmod +x /etc/init.d/nginx
RUN update-rc.d nginx defaults
#RUN apt-get update
RUN mkdir /HLS
RUN mkdir /HLS/live
RUN mkdir /HLS/mobile
RUN mkdir /video_recordings
RUN chmod -R 777 /video_recordings
RUN ufw limit ssh
RUN ufw allow 80
RUN ufw allow 1935
RUN ufw enable
ADD crossdomain.xml /usr/local/nginx/html/crossdomain.xml

CMD ["nginx", "-c", "nginx.conf"]
