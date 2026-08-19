FROM registry.access.redhat.com/ubi10/ubi@sha256:c9da135a3cdc105995ba8b75e7344671dac9560145bcf9ab73f42e64e441458c

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]