FROM alpine

RUN apk -U add dnsmasq

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN chmod 777 /bin/docker-entrypoint.sh

# ENTRYPOINT ["/bin/docker-entrypoint.sh"]

EXPOSE 53 53/udp
CMD ["dnsmasq", "--no-daemon"]
