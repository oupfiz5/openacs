# * Arguments
ARG \
    NS_IMAGE_REPOSITORY="${NS_IMAGE_REPOSITORY}" \
    NS_IMAGE_NAME="${NS_IMAGE_NAME}" \
    NS_IMAGE_TAG="${NS_IMAGE_TAG}"

# * From
FROM ${NS_IMAGE_REPOSITORY}/${NS_IMAGE_NAME}:${NS_IMAGE_TAG}

# * Environment
ENV NS_CONF="/usr/local/ns/conf/openacs_config.tcl"

ARG \
    BUILD_DATE="${BUILD_DATE}" \
    OACS_TAG="${OACS_TAG}"

# * Labels
# hadolint ignore=DL3048
LABEL \
    maintainer="Oupfiz V <oupfiz5@yandex.ru>" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.authors="Oupfiz V (Five)" \
    org.opencontainers.image.url="https://chiselapp.com/user/oupfiz5/repository/openacs/home" \
    org.opencontainers.image.documentation="https://chiselapp.com/user/oupfiz5/repository/openacs/wiki" \
    org.opencontainers.image.source="https://chiselapp.com/user/oupfiz5/repository/openacs/brlist" \
    org.opencontainers.image.version="0.0.3d" \
    org.opencontainers.image.revision="" \
    org.opencontainers.image.vendor="" \
    org.opencontainers.image.licenses="" \
    org.opencontainers.image.ref.name="" \
    org.opencontainers.image.title="OpenACS on NaviServer docker image using ubuntu" \
    org.opencontainers.image.description="OpenACS on NaviServer docker image using ubuntu" \
    custom.package.version.openacs="${OACS_TAG}" \ org.opencontainers.image.ns="${NS_IMAGE_REPOSITORY}/${NS_IMAGE_NAME}:${NS_IMAGE_TAG}"

# * Copy configuration files
# COPY rootfs/etc /etc/

# * Copy run file
COPY rootfs/run_openacs.sh /


# * Install OpenACS
RUN mkdir -p /var/www

ADD https://github.com/openacs/openacs-core/archive/"${OACS_TAG}".tar.gz /tmp/"${OACS_TAG}".tar.gz

# ** Run
# hadolint ignore=DL3008
RUN tar xzf /tmp/"${OACS_TAG}".tar.gz -C /var/www; \
    mv /var/www/openacs-core-"${OACS_TAG}" /var/www/openacs; \
    mkdir /var/www/openacs/log/; \
    chown -R nsadmin:nsadmin /var/www/openacs; \
    rm /tmp/"${OACS_TAG}".tar.gz

# ** Install openacs-bootstrap3-theme
ADD https://github.com/openacs/openacs-bootstrap3-theme/archive/"${OACS_TAG}".tar.gz /tmp/openacs-bootstrap3-theme-"${OACS_TAG}".tar.gz

RUN tar xzf /tmp/openacs-bootstrap3-theme-"${OACS_TAG}".tar.gz -C /var/www/openacs/packages; \
    mv /var/www/openacs/packages/openacs-bootstrap3-theme-"${OACS_TAG}" /var/www/openacs/packages/openacs-bootstrap3-theme; \
    rm /tmp/openacs-bootstrap3-theme-"${OACS_TAG}".tar.gz

# ** Copy openacs configuration files
COPY rootfs/usr/local/ns/conf/openacs_config.tcl /usr/local/ns/conf/openacs_config.tcl
COPY rootfs/usr/local/ns/conf/config_vars.tcl /usr/local/ns/conf/config_vars.tcl
COPY rootfs/var/www/openacs/www/SYSTEM/openacs-test.tcl /var/www/openacs/www/SYSTEM/openacs-test.tcl

# ** Install and configure extra OpenACS packages
COPY rootfs/usr/local/ns/conf/install-oacs-core-config.xml /var/www/openacs/install.xml

# * Change directory
WORKDIR /var/www/openacs

# * Expose
EXPOSE 8000

# * Environment

# ** Entrypoint
ENTRYPOINT ["/run_openacs.sh"]

# ** Cmd
CMD [ "/usr/local/ns/conf/openacs_config.tcl"]
