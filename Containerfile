FROM registry.access.redhat.com/ubi10/ubi@sha256:bce838c4ddd37b36b8f10a372efbd8a6c7de5b86cb50d639535d8f50e41372f0

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]