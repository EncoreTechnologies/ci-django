# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd git wget make which gcc python-devel openssl openssl-devel; yum clean all
ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N '' 

RUN wget https://bootstrap.pypa.io/get-pip.py -P /tmp
RUN chmod 755 /tmp/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install virtualenv

RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

RUN chmod 755 /start.sh
RUN ./start.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
