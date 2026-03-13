FROM registry.access.redhat.com/ubi10/ubi@sha256:f573194e8e5231f1c9340c497e1f8d9aa9dbb42b2849e60341e34f50eec9477e

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]