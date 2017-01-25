FROM alpine:3.5
RUN apk --no-cache add alpine-sdk coreutils python py-pip su-exec \
  && pip install awscli
COPY script/builder script/prepare_user /bin/
ENTRYPOINT ["prepare_user", "builder"]
ENV RSA_PRIVATE_KEY_NAME ssh.rsa
ENV PACKAGER_PRIVKEY /home/builder/${RSA_PRIVATE_KEY_NAME}
ENV REPODEST /packages
