#This is a vulnerable container, don't use this in production!
FROM tomcat:7.0-jre8

# Install required packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        unzip \
    ; \
    curl -fsSL -o struts-2.3.28.1-apps.zip \
            "http://archive.apache.org/dist/struts/2.3.28.1/struts-2.3.28.1-apps.zip"; \
    unzip struts-2.3.28.1-apps.zip -d /tmp/; \
    cp /tmp/struts-2.3.28.1/apps/struts2-showcase.war /usr/local/tomcat/webapps/; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $fetchDeps; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf /tmp/*

CMD ["catalina.sh", "run"]
