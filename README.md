# rpi-frotz

##BUILD
  docker build -t azcoigreach/rpi-frotz https://github.com/azcoigreach/rpi-frotz.git
  
##RUN 
  docker run --restart unless-stopped -tid -v /home/pi/frotz:/home/frotz -v /usr/games:/usr/games azcoigreach/rpi-frotz
  
##ATTACH to container
  
