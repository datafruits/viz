# viz setup

Here's how to run the docker image.

docker run  -p 1935:1935 -p 8080:8080 -p 16666:4443 -v /home/deploy/viz/fullchain.pem:/etc/letsencrypt/live/viz.streampusher.com/fullchain.pem -v /home/deploy/viz/privkey.pem:/etc/letsencrypt/live/viz.streampusher.com/privkey.pem datafruits/viz:latest 


