FROM alpine:edge
RUN apk --no-cache add alpine-sdk coreutils python py-pip su-exec \
  && pip install awscli
COPY builder prepare_user /bin/
ENTRYPOINT ["prepare_user"]
ENV RSA_PRIVATE_KEY_NAME ssh.rsa
ENV PACKAGER_PRIVKEY /home/builder/${RSA_PRIVATE_KEY_NAME}
ENV REPODEST /packages
