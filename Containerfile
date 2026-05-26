FROM registry.access.redhat.com/ubi10/ubi@sha256:af39a7aee3d546e3c89119e69ca821647750c53b27747f9aa06beb66b4ea81b6

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]