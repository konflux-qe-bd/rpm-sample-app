FROM registry.access.redhat.com/ubi10/ubi@sha256:1b616c4a90d6444b394d5c8f4bd9e15a394d95dd628925d0ec80c257fdc5099c

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]