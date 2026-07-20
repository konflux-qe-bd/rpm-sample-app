FROM registry.access.redhat.com/ubi10/ubi@sha256:802583cce6369422f62434fccd9bf310655c065cc9f4f60a007faf095e57afc7

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]