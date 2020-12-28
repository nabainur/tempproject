openssl req -x509 -nodes -days 30 -newkey rsa:2048 -keyout server.key -out server.crt \
	-subj "/C=RU/ST=RB/L=UFA/O=TestCO/OU=IT/CN=109.195.147.30"
openssl req -x509 -nodes -days 30 -newkey rsa:2048 -keyout client.key -out client.crt \
	-subj "/C=RU/ST=RB/L=UFA/O=TestCO/OU=IT/CN=Test"
openssl pkcs12 -export -out client.pfx -inkey client.key -in client.crt -password pass:password
openssl pkcs12 -export -out server.pfx -inkey server.key -in server.crt -password pass:password
