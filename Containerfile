FROM registry.access.redhat.com/ubi10/ubi@sha256:9d3b5102e7ae4f82914a1791610b75acef134b93158be6005b6ae9218c163550

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]