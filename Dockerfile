FROM openjdk:7
COPY tmp/ /usr/src/myapp/
WORKDIR /usr/src/myapp
RUN /bin/bash -c 'sed -i s/hostname/$HOSTNAME/ mappings/service.json'
CMD java -jar wiremock-standalone-2.27.2.jar \
        --https-port 443 \
        --https-require-client-cert \
        --https-truststore client.pfx \
        --https-keystore server.pfx \
        --truststore-password password \
        --disable-http \
        --keystore-type PKCS12
