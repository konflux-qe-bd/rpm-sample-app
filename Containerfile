FROM registry.access.redhat.com/ubi10/ubi@sha256:be840bb76e74900d39d5e4620c184e89382dcfce09cb05c98b4e1246d55612a5

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]