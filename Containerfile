FROM registry.access.redhat.com/ubi10/ubi@sha256:b9e5730d0b6dba45e82c15fb8f49c6082e01cdcb5e4f6ba96535dab42a4d2cf0

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]