FROM alpine
RUN echo http://mirror.yandex.ru/mirrors/alpine/v3.2/main > /etc/apk/repositories
RUN apk add --update bash openssl openjdk7-jre-base && rm -rf /var/cache/apk/*
WORKDIR /var 
ENV te TEE-CLC-14.0.1
ENV TF_CLC_HOME /var/${te}
RUN wget http://dhost0.kyiv.ciklum.net:8081/content/repositories/cis-internal/${te}.zip && unzip ${te}.zip && chmod a+x /var/${te}/tf && ln /var/${te}/tf /usr/bin/tf && rm ${te}.zip
