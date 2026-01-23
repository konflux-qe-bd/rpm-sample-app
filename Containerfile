FROM registry.access.redhat.com/ubi10/ubi@sha256:8eb40a0d11d7ad057dc5f8ca60bf9a15dec60d0e9b4c9aab7d3ecf9182bb4986

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]