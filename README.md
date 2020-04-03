# viz setup


Here is how to build on of these viz servers from scratch :)

sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev
wget http://nginx.org/download/nginx-1.14.0.tar.gz
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
sudo apt-get install unzip
tar -zxvf nginx-1.14.0.tar.gz
unzip master.zip  
cd nginx-1.14.0/
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
make
sudo make install
sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
sudo chmod +x /etc/init.d/nginx
sudo update-rc.d nginx defaults
sudo apt-get update
sudo apt-get install ffmpeg
sudo mkdir /HLS 
sudo mkdir /HLS/live
sudo mkdir /HLS/mobile 
sudo mkdir /video_recordings
sudo chmod -R 777 /video_recordings
sudo ufw limit ssh 
sudo ufw allow 80
sudo ufw allow 1935 
sudo ufw enable  
sudo nano /usr/local/nginx/html/crossdomain.xml
(add this to file & save)
    <?xml version="1.0"?>
      <!DOCTYPE cross-domain-policy SYSTEM "http://www.adobe.com/xml/dtds/cross-domain-policy.dtd">
      <cross-domain-policy>
      <allow-access-from domain="*"/>
    </cross-domain-policy>

service nginx restart

all set for basic setup!




