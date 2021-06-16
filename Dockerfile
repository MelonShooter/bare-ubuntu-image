FROM  ubuntu:20.04

ENV   DEBIAN_FRONTEND noninteractive

RUN   useradd -m -d /home/container -s /bin/bash container

RUN   apt update \
 &&   apt upgrade -y

RUN   apt install -y libc6

## configure locale
RUN   update-locale lang=en_US.UTF-8 \
 &&   dpkg-reconfigure --frontend noninteractive locales

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/bash", "/entrypoint.sh"]