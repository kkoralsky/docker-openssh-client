FROM alpine:3.8

RUN apk add --no-cache openssh-client

ARG username=deploy
ARG home=/home/${username}

COPY entrypoint.sh /

RUN adduser -D -h ${home} ${username} && \
    mkdir ${home}/.ssh && \
    chown ${username}:${username} ${home}/.ssh && \
    chmod 0700 ${home}/.ssh && \
    chmod +x /entrypoint.sh

USER ${username}
WORKDIR ${home}
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sh"]
