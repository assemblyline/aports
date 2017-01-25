FROM alpine:3.5
RUN apk --no-cache add alpine-sdk coreutils \
  && adduser -G abuild -g "Package Builder" -s /bin/ash -D builder \
  && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && mkdir /packages \
  && chown builder:abuild /packages
USER builder
COPY script/builder /bin/
ENTRYPOINT ["builder", "-r"]
WORKDIR /home/builder/aports
ENV RSA_PRIVATE_KEY_NAME ssh.rsa
ENV PACKAGER_PRIVKEY /home/builder/${RSA_PRIVATE_KEY_NAME}
ENV REPODEST /packages
COPY main ./main
