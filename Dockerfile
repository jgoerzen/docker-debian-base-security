FROM jgoerzen/debian-base-standard:buster
MAINTAINER John Goerzen <jgoerzen@complete.org>

COPY setup/ /usr/local/debian-base-setup/
COPY preinit /usr/local/preinit
RUN /usr/local/debian-base-setup/030-debian-base-security
COPY debian-base-security.conf /etc/needrestart/conf.d/

CMD ["/usr/local/bin/boot-debian-base"]

