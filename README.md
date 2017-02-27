# rpi-frotz - supervisord

##BUILD
  docker build -t azcoigreach/rpi-frotz https://github.com/azcoigreach/rpi-frotz.git
  
##RUN 
  docker run --restart unless-stopped -tidP -v /home/pi/frotz:/home/frotz -v /usr/games:/usr/games azcoigreach/rpi-frotz
  
##SSH to game
  Conform SSH port of rpi-frotz container 
    docker ps
  
  ssh root@localhost -p [container_port]

  user root
  pass frotz
