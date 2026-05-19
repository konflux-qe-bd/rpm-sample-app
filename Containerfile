FROM registry.access.redhat.com/ubi10/ubi@sha256:936bf25d1a9b2c0c00aa67ec55f8347273763b7c64317ba7404b4b87736b2af2

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]