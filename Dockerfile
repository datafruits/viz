FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev unzip ffmpeg wget zlib1g zlib1g-dev libssl-dev sudo

RUN useradd --create-home -s /bin/bash www ;\
  adduser www sudo
RUN echo "Defaults    !requiretty" >> /etc/sudoers
RUN echo "%sudo ALL=NOPASSWD: ALL" >> /etc/sudoers

USER www
WORKDIR /home/www

RUN wget http://nginx.org/download/nginx-1.14.0.tar.gz -O /home/www/nginx-1.14.0.tar.gz
RUN wget https://github.com/arut/nginx-rtmp-module/archive/master.zip -O /home/www/master.zip
RUN cd /home/www && tar -zxvf nginx-1.14.0.tar.gz
RUN cd /home/www && unzip master.zip
RUN cd /home/www/nginx-1.14.0/ && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master && make && sudo make install
#RUN sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
#RUN sudo chmod +x /etc/init.d/nginx
#RUN update-rc.d nginx defaults
RUN mkdir /home/www/HLS
RUN mkdir /home/www/HLS/live
RUN mkdir /home/www/HLS/mobile
RUN mkdir /home/www/video_recordings
RUN chmod -R 777 /home/www/video_recordings
ADD crossdomain.xml /usr/local/nginx/html/crossdomain.xml
ADD nginx.conf /home/www
RUN sudo chown -R www:www /usr/local/nginx

EXPOSE 80 443 1935

CMD ["/usr/local/nginx/sbin/nginx", "-c", "/home/www/nginx.conf"]
