FROM registry.access.redhat.com/ubi10/ubi@sha256:937cb57b9dead25a68ca3b40f40db874dcf7b97dd0b438aca32c54e26220b415

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]