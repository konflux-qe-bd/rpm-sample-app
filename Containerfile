FROM registry.access.redhat.com/ubi10/ubi@sha256:64b34b13c0dda61ed9b977bde8068eb0d350f4afb75142715e83be68373e4848

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]