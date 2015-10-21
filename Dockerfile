FROM centos:6.6

RUN echo -e "[mongodb-org-3.0]" >> /etc/yum.repos.d/mongodb-org-3.0.repo \ 
 && echo "name=MongoDB Repository" >> /etc/yum.repos.d/mongodb-org-3.0.repo \
 && echo "baseurl=https://repo.mongodb.org/yum/redhat/6/mongodb-org/3.0/x86_64/" >> /etc/yum.repos.d/mongodb-org-3.0.repo \
 && echo "gpgcheck=0" >> /etc/yum.repos.d/mongodb-org-3.0.repo \
 && echo "enabled=1" >> /etc/yum.repos.d/mongodb-org-3.0.repo

RUN yum -y update

RUN yum install -y \
    vim \
    tar \
    tree \
    openssh-server \
    openssh-clients \
    gcc \
    gcc-c++ \
    zlib-devel \
    openssl-devel \
    readline-devel \
    sqlite-devel \
    mongodb-org

COPY conf/mongod.conf /etc/
COPY conf/replset.js /tmp/

# allow empty password root ssh
RUN sed -ri 's/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config \
 && passwd -d root

# JST
RUN cp /usr/share/zoneinfo/Japan /etc/localtime \
 && echo "ZONE=\"Asia/Tokyo\"" > /etc/sysconfig/clock

# system python
RUN curl -s https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz | tar -xz -C . \
 && cd Python-2.7.10/ \
 && ./configure --with-threads --enable-shared --prefix=/usr/local \
 && make \
 && make altinstall

RUN ln -s /usr/local/lib/libpython2.7.so.1.0 /lib64/ \
 && echo "/usr/local/lib" >> /etc/ld.so.conf \
 && ldconfig \
 && ln -s /usr/local/bin/python2.7 /usr/local/bin/python \
 && ln -s /usr/local/bin/python2.7 /usr/local/bin/python2

RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python

RUN pip install pymongo==3.0.3 \
 && pip install jsonschema==2.5.1 \
 && pip install ipython==3.2.0

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && chmod 700 /etc/bootstrap.sh
ENV BOOTSTRAP /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh", "-d"]
