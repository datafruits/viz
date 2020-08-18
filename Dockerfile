FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y
RUN sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev

RUN wget http://nginx.org/download/nginx-1.14.0.tar.gz
RUN wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
RUN sudo apt-get install unzip
RUN tar -zxvf nginx-1.14.0.tar.gz
RUN unzip master.zip
RUN cd nginx-1.14.0/
RUN ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
RUN make
RUN sudo make install
RUN sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
RUN sudo chmod +x /etc/init.d/nginx
RUN sudo update-rc.d nginx defaults
RUN sudo apt-get update
RUN sudo apt-get install ffmpeg
RUN sudo mkdir /HLS
RUN sudo mkdir /HLS/live
RUN sudo mkdir /HLS/mobile
RUN sudo mkdir /video_recordings
RUN sudo chmod -R 777 /video_recordings
RUN sudo ufw limit ssh
RUN sudo ufw allow 80
RUN sudo ufw allow 1935
RUN sudo ufw enable
ADD crossdomain.xml /usr/local/nginx/html/crossdomain.xml

CMD ["nginx", "-c", "nginx.conf"]
