FROM tomcat:8.5-jdk8

RUN apt-get -y update && apt-get -y upgrade && apt-get -y clean

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        unzip \
        curl; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*; \
    curl -fsSL -o /tmp/struts-2.5.22-apps.zip \
      "https://apache.website-solution.net/struts/2.5.22/struts-2.5.22-apps.zip"; \
    unzip /tmp/struts-2.5.22-apps.zip -d /tmp; \
    cp /tmp/struts-2.5.22/apps/struts2-showcase.war /usr/local/tomcat/webapps/; \
    rm -rf /tmp/struts*;

CMD ["catalina.sh", "run"]
