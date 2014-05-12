# DOCKER-VERSION 0.10.0

FROM stackbrew/ubuntu:14.04
MAINTAINER Michael Guymon, michael@tobedevoured.com

#
# Torquebox
#

# Moved to script to help fight AUF 42 parent max
ADD apt.sh /apt.sh
RUN chmod u+x /apt.sh && sh /apt.sh

RUN mkdir -p /opt/torquebox/applications && useradd torquebox -c"Torquebox system user" -M -ptorquebox

# Unzip the TB
RUN wget -O /opt/torquebox-dist-3.1.0-bin.zip http://torquebox.org/release/org/torquebox/torquebox-dist/3.1.0/torquebox-dist-3.1.0-bin.zip && unzip -q /opt/torquebox-dist-3.1.0-bin.zip -d /opt && mv /opt/torquebox-3.1.0 /opt/torquebox

# Set env for TB
ENV TORQUEBOX_HOME /opt/torquebox
ENV JBOSS_HOME /opt/torquebox/jboss
ENV JRUBY_HOME /opt/torquebox/jruby
ENV PATH $JBOSS_HOME/bin:$JRUBY_HOME/bin:$PATH

ADD start_torquebox.sh /opt/torquebox/start_torquebox.sh
RUN chown -R torquebox:torquebox /opt/torquebox && chmod u+x /opt/torquebox/start_torquebox.sh

# Docker VOLUME hates symlinks
VOLUME ["/opt/torquebox/applications", "/opt/torquebox/jruby", "/opt/torquebox/jboss/standalone/log", "/opt/torquebox/jboss/standalone/data", "/opt/torquebox/jboss/standalone/deployments"]

EXPOSE 9999 9990 9443 8009 8080 8443 45700 7600 57600 55200 45688 54200 5445 9876 5455 23364 4447 4712 4713 8675 8676

CMD ["/opt/torquebox/start_torquebox.sh"]
