# rpi-frotz
  Frotz+gosu to fix user permissions and allow user level access to game files and saves inside of the container. 

##BUILD
  docker build -t azcoigreach/rpi-frotz https://github.com/azcoigreach/rpi-frotz.git
  
##RUN 
  docker run --restart unless-stopped --name rpi-frotz -tid -v /home/pi/frotz:/home/user/frotz -e LOCAL_USER_ID=`id -u $USER` azcoigreach/rpi-frotz /bin/bash
  
##ATTACH to container
  docker attach rpi-frotz
