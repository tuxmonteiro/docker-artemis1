FROM tuxmonteiro/docker-openjdk:8

MAINTAINER tuxmonteiro

ADD apache-artemis-1.5.4-1globocom-1.el7.noarch.rpm /tmp
ADD wrapper_generic_globo-3.5.32-1.el7.x86_64.rpm /tmp
ADD java18_globo-1.0-1.el7.noarch.rpm /tmp
ADD artemis-roles.properties /tmp
ADD artemis-users.properties /tmp
ADD bootstrap.xml /tmp
ADD broker.xml /tmp
ADD galeb-limits.conf /tmp
ADD healthcheck-1.0-SNAPSHOT.war /tmp
ADD jgroups.xml /tmp
ADD logging.properties /tmp
ADD login.config /tmp
ADD wrapper.conf /tmp
ADD initscript /etc/init.d/galeb

RUN yum clean all \
    && yum install -y yum-plugin-ovl \
    && yum install -y sudo \
    && yum install -y /tmp/java18_globo-1.0-1.el7.noarch.rpm  /tmp/wrapper_generic_globo-3.5.32-1.el7.x86_64.rpm /tmp/apache-artemis-1.5.4-1globocom-1.el7.noarch.rpm \
    && yum clean all

USER root

CMD ["/etc/init.d/galeb", "start"]
