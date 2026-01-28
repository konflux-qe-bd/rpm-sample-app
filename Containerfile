FROM registry.access.redhat.com/ubi10/ubi@sha256:305de6aef2726cbd93a3bf2e310d2804363d63ad62a8278c1ab4cca2d447803e

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]