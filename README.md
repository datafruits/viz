# viz setup


Here is how to build on of these viz servers from scratch :)<br/>
<br/>
sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev <br/>
wget http://nginx.org/download/nginx-1.14.0.tar.gz<br/>
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip<br/>
sudo apt-get install unzip<br/>
tar -zxvf nginx-1.14.0.tar.gz<br/>
unzip master.zip  <br/>
cd nginx-1.14.0/<br/>
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master<br/>
make<br/>
sudo make install<br/>
sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx<br/>
sudo chmod +x /etc/init.d/nginx<br/>
sudo update-rc.d nginx defaults<br/>
sudo apt-get update<br/>
sudo apt-get install ffmpeg<br/>
sudo mkdir /HLS <br/>
sudo mkdir /HLS/live<br/>
sudo mkdir /HLS/mobile <br/>
sudo mkdir /video_recordings<br/>
sudo chmod -R 777 /video_recordings<br/>
sudo ufw limit ssh <br/>
sudo ufw allow 80<br/>
sudo ufw allow 1935 <br/>
sudo ufw enable  <br/>
sudo nano /usr/local/nginx/html/crossdomain.xml<br/>
(add this to file & save)<br/><br/>
    <?xml version="1.0"?><br/>
      <!DOCTYPE cross-domain-policy SYSTEM "http://www.adobe.com/xml/dtds/cross-domain-policy.dtd"><br/>
      <cross-domain-policy><br/>
      <allow-access-from domain="*"/><br/>
    </cross-domain-policy><br/>
<br/><br/>
service nginx restart<br/>
<br/><br/>
all set for basic setup!




