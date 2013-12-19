# DOCKER-VERSION 0.7.1

FROM ubuntu:13.04
MAINTAINER Michael Guymon, mguymon@igicom.com

#
# Torquebox
#
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer unzip

RUN mkdir /opt/torquebox
RUN useradd torquebox -c"Torquebox system user" -M -ptorquebox

# Unzip the TB
ADD build/torquebox-dist-3.0.1-bin.zip /opt/torquebox/torquebox-dist-3.0.1-bin.zip
RUN unzip -q /opt/torquebox/torquebox-dist-3.0.1-bin.zip -d /opt/torquebox
RUN ln -s /opt/torquebox/torquebox-3.0.1 /opt/torquebox/current

# Set env for TB
ENV TORQUEBOX_HOME /opt/torquebox/current
ENV JBOSS_HOME /opt/torquebox/current/jboss
ENV JRUBY_HOME /opt/torquebox/current/jruby
ENV PATH $JBOSS_HOME/bin:$JRUBY_HOME/bin:$PATH

ADD start_torquebox.sh /opt/torquebox/start_torquebox.sh
RUN chown -R torquebox:torquebox /opt/torquebox
RUN chmod u+x /opt/torquebox/start_torquebox.sh

# Docker VOLUME hates symlinks
VOLUME ["/opt/torquebox/torquebox-3.0.1/jboss/standalone/log", "/opt/torquebox/torquebox-3.0.1/jboss/standalone/deployments"]

EXPOSE 6666 8080 8443 5445 8675 8676

CMD ["/opt/torquebox/start_torquebox.sh"]
