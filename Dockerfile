FROM rockylinux:8

RUN yum upgrade -y && yum install -y python3 pkg-config
WORKDIR /root
ADD https://github.com/apple/foundationdb/releases/download/7.2.3/foundationdb-clients-7.2.3-1.el7.x86_64.rpm .
ADD https://github.com/apple/foundationdb/releases/download/7.2.3/foundationdb-server-7.2.3-1.el7.x86_64.rpm .
RUN rpm -i foundationdb-clients-7.2.3-1.el7.x86_64.rpm foundationdb-server-7.2.3-1.el7.x86_64.rpm
# https://forums.foundationdb.org/t/how-to-add-a-server-container-to-a-cluster/394/2
# https://forums.foundationdb.org/t/simple-dockerfile/280/5

# Add tini for kubernetes
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini .
RUN chmod a+x tini

ADD start.sh ./
ADD foundationdb.conf /etc/foundationdb/foundationdb.conf