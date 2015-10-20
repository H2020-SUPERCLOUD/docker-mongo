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
    mongodb-org

# JST
RUN cp /usr/share/zoneinfo/Japan /etc/localtime \
 && echo "ZONE=\"Asia/Tokyo\"" > /etc/sysconfig/clock

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && chmod 700 /etc/bootstrap.sh
ENV BOOTSTRAP /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh", "-d"]
