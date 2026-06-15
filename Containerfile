FROM registry.access.redhat.com/ubi10/ubi@sha256:0e04460ccf1ad68374b2f1ca28f8539f817fe8bb6107478df445e05dccb1995e

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]