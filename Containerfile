FROM registry.access.redhat.com/ubi10/ubi@sha256:0dd39702a460602f3c15a9f5abd7620de550a8d23ffcb249c0ad4aa163ec60ae

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]