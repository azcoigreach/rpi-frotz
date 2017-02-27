FROM resin/rpi-raspbian:latest

RUN apt-get update \
   && apt-get install --no-install-recommends -y frotz unzip \
   && apt-get clean \
   && apt-get autoclean \
   && apt-get autoremove \
   && rm -rf /var/lib/apt/lists/*

ENV PATH /usr/games/:$PATH

RUN useradd -ms /bin/bash frotz
RUN chmod 0755 /home/frotz
USER frotz
WORKDIR /home/frotz
