FROM postman/newman:5.3.1-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl zip bind-tools

RUN npm install -g newman-reporter-csvallinone && \
    rm -rf /var/cache/apk/* /root/.npm

RUN echo "nameserver 8.8.8.8" > /tmp/resolv.conf && \
    echo "nameserver 1.1.1.1" >> /tmp/resolv.conf

ENV NODE_PATH=/usr/local/lib/node_modules

WORKDIR /etc/newman

ENTRYPOINT ["/bin/sh", "-c", "cp /tmp/resolv.conf /etc/resolv.conf && exec newman"]