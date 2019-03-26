FROM jgoerzen/debian-base-standard:jessie
MAINTAINER John Goerzen <jgoerzen@complete.org>

COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/030-debian-base-security

CMD ["/usr/local/bin/boot-debian-base"]

