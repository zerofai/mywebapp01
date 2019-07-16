#This is a vulnerable container, don't use this in production!
FROM tomcat:7-jdk8-openjdk-slim                                                                                                                                
  
RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        unzip \
        curl; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*; \
    curl -fsSL -o /tmp/struts-2.3.28.1-apps.zip \
      "http://archive.apache.org/dist/struts/2.3.28.1/struts-2.3.28.1-apps.zip"; \
    unzip /tmp/struts-2.3.28.1-apps.zip -d /tmp; \
    cp /tmp/struts-2.3.28.1/apps/struts2-showcase.war /usr/local/tomcat/webapps/; \
    rm -rf /tmp/struts*;

CMD ["catalina.sh", "run"]
