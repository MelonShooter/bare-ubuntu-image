FROM  ubuntu:20.04

ENV   DEBIAN_FRONTEND noninteractive

RUN   useradd -m -d /home/container -s /bin/bash container

RUN   apt update \
 &&   apt upgrade -y

RUN   apt install -y libc6

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/bash", "/entrypoint.sh"]