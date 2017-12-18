FROM centos:7

# copy ssh keys
ADD ./ssh/ /root/.ssh/
RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/*

# update yum and install python
RUN yum update -y \
    yum install python

# install pip
RUN curl https://bootstrap.pypa.io/get-pip.py | python

# install python libs for use aws api, ansible
RUN pip install --upgrade pip \
    && pip install boto ansible

# add ansible config
ADD ./config/ansible.cfg /root/.ansible.cfg

# change work dir
RUN mkdir /ansible
WORKDIR /ansible

CMD ["/sbin/init", "-D"]