FROM registry.access.redhat.com/ubi10/ubi@sha256:ab7e7c852eaa79e80ebb201553da6b1428aff469d0f5d4877b0ffa64879fe2b2

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]