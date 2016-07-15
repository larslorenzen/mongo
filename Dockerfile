FROM centos

# Upgrading system
RUN yum -y update; yum clean all
COPY ./mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo
RUN yum install -y mongodb-org; yum clean all
RUN yum install -y bzip2

RUN chown -R mongod:mongod /var/lib/mongo

# Copy config mongodb
ADD etc/ /etc/

COPY ./mongodaemon.sh /usr/bin/mongodaemon

# User
USER mongod

# Set the environment variables
ENV HOME /var/lib/mongo

# Working directory
WORKDIR /var/lib/mongo

ENTRYPOINT ["/bin/mongod"]
CMD ["-f", "/etc/lotto.yml"]

# Expose ports.
EXPOSE 27017
