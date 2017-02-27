FROM resin/rpi-raspbian:latest

RUN apt-get update \
   && apt-get install --no-install-recommends -y frotz unzip supervisor openssh-server \
   && apt-get clean \
   && apt-get autoclean \
   && apt-get autoremove \
   && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
 
# SET ROOT PASSWORD 
RUN echo 'root:xeropus' | chpasswd && \
  mkdir /var/run/sshd && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config && \
    sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    mkdir /root/.ssh

RUN useradd -ms /bin/bash frotz 
USER frotz
WORKDIR /home/frotz

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
ENV PATH /usr/games/:$PATH
RUN echo "export $PATH" >> /etc/profile

EXPOSE 22
CMD ["/usr/bin/supervisord"]
