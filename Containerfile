FROM registry.access.redhat.com/ubi10/ubi@sha256:ccb838d655199bff6a77fc4296a2b2a44e00163dabd0ba8b0d9030f281ec935f

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]