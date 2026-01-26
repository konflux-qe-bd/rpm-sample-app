FROM registry.access.redhat.com/ubi10/ubi@sha256:c410d428c8c01f7246f350a174c4cbbd47c799b667a724f254bfe7b7e40adb44

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]