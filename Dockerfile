FROM jrottenberg/ffmpeg:4.4-ubuntu

RUN apt-get update && apt-get install -y curl

COPY stream.sh /stream.sh
RUN chmod +x /stream.sh

CMD ["/stream.sh"]
