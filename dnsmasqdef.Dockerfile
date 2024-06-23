FROM alpine:3.18

RUN apk --no-cache add dnsmasq

COPY /dnsmasq/hosts /etc/hosts
COPY /dnsmasq/dnsmasq.conf /etc/

#DNS
EXPOSE 53/udp
#DHCP
EXPOSE 67/udp

ENTRYPOINT ["dnsmasq", "-k"]