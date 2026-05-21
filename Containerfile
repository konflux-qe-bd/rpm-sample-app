FROM registry.access.redhat.com/ubi10/ubi@sha256:eb702361cac064da1e7fb9b09eb030562a832209ed1fb1d6765d617ed6294e61

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

RUN dnf -y install httpd-tools

CMD ["ab", "-V"]