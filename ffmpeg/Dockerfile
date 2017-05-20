from ubuntu

RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install -y supervisor 
RUN apt-get install -y curl wget

RUN apt-get install -y ffmpeg
RUN apt-get install -y bc

ADD splice.sh /usr/local/bin/splice

CMD ["/usr/bin/supervisord", "-n"]

