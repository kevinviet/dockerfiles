sudo docker run -d --name H^CeBridge --privileged --net=host -p 51826:51826 --restart=always -P -v /home/pi/.homebridge:/root/.homebridge -t my-homebridge
