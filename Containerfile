FROM registry.access.redhat.com/ubi10/ubi@sha256:516ef28e78e388d12e31618326da68e21dcfc40f767f0c37c3b57059c642a4f0

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]