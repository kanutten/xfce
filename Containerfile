## 1. BUILD ARGS

ARG SOURCE_IMAGE="vauxite"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="latest"
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}


### 3. MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh
COPY system_files /
#COPY scripts /scripts
COPY --chmod=755 scripts /scripts

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    /scripts/just.sh && \
    /scripts/karg.sh && \
#    /scripts/dconf.sh && \
#    /scripts/msfont.sh && \
    /scripts/install_packages.sh && \
    /scripts/cleanup.sh && \
    ostree container commit
