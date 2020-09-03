FROM debian:stable
MAINTAINER Wolf-Bastian Pöttner <bastian@poettner.de>

# Install dependencies
RUN apt-get update && apt-get -y -qq install bash curl

# Install our scripts
COPY ddns_update.sh /

# Run document processor
CMD ["bash", "/ddns_update.sh"]
