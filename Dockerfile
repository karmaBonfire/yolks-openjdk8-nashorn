FROM --platform=$TARGETOS/$TARGETARCH openjdk:8u312

RUN apt-get update -y \
 			&& apt-get install -y lsof curl ca-certificates tzdata openssl tar sqlite3 git fontconfig libfreetype6 iproute2 libstdc++6 \
 			&& useradd -d /home/container -m container


USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
