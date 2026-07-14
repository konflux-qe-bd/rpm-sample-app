FROM registry.access.redhat.com/ubi10/ubi@sha256:fe92bdc2c333e1cdf6c779c10eafcc4a6b0b343de85ff7d1ee26c600390b6d62

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]