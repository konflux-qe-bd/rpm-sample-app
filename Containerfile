FROM registry.access.redhat.com/ubi10/ubi@sha256:37d90a02d14afed06b6fff1ed0a33cd07b96187e90ed46d8871fdce550538b43

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]