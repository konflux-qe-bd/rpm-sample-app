FROM registry.access.redhat.com/ubi10/ubi@sha256:387dc083b03817a603f76da19e017542afcef94d25c2a7d6fc4fd43af9d81fe7

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]