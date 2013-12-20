# DOCKER-VERSION 0.7.1

FROM stackbrew/ubuntu:13.04
MAINTAINER Michael Guymon, michael@tobedevoured.com

#
# Torquebox
#
RUN echo deb http://archive.ubuntu.com/ubuntu raring main universe multiverse > /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:webupd8team/java -y && apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer unzip wget

RUN mkdir /opt/torquebox && useradd torquebox -c"Torquebox system user" -M -ptorquebox

# Unzip the TB
RUN wget -O /opt/torquebox/torquebox-dist-3.0.1-bin.zip http://torquebox.org/release/org/torquebox/torquebox-dist/3.0.1/torquebox-dist-3.0.1-bin.zip && unzip -q /opt/torquebox/torquebox-dist-3.0.1-bin.zip -d /opt/torquebox && ln -s /opt/torquebox/torquebox-3.0.1 /opt/torquebox/current

# Set env for TB
ENV TORQUEBOX_HOME /opt/torquebox/current
ENV JBOSS_HOME /opt/torquebox/current/jboss
ENV JRUBY_HOME /opt/torquebox/current/jruby
ENV PATH $JBOSS_HOME/bin:$JRUBY_HOME/bin:$PATH

ADD start_torquebox.sh /opt/torquebox/start_torquebox.sh
RUN chown -R torquebox:torquebox /opt/torquebox && chmod u+x /opt/torquebox/start_torquebox.sh

# Docker VOLUME hates symlinks
VOLUME ["/opt/torquebox/torquebox-3.0.1/jboss/standalone/log", "/opt/torquebox/torquebox-3.0.1/jboss/standalone/deployments"]

EXPOSE 6666 8080 8443 5445 8675 8676

CMD ["/opt/torquebox/start_torquebox.sh"]
