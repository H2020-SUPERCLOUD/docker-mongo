FROM centos:6.6

RUN yum -y update

RUN yum install -y \
    vim \
    tar \
    git \
    gcc \
    gcc-c++ \
    zlib-devel \
    openssl-devel \
    readline-devel \
    sqlite-devel

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

# java
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie' \
 && rpm -i jdk-7u79-linux-x64.rpm \
 && rm jdk-7u79-linux-x64.rpm

# mvn
RUN curl -s http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s ./apache-maven-* maven

ENV JAVA_HOME=/usr/java/default \
    M2_HOME=/usr/local/maven
 
ENV PATH $PATH:$JAVA_HOME/bin:$M2_HOME/bin

RUN echo '# JDK' >> ~/.bash_profile \
 && echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bash_profile \
 && echo '# M2_HOME' >> ~/.bash_profile \
 && echo "export M2_HOME=$M2_HOME" >> ~/.bash_profile \
 && echo '' >> ~/.bash_profile \
 && echo "export PATH=$PATH" >> ~/.bash_profile

RUN git clone https://github.com/brianfrankcooper/YCSB.git \
 && cd YCSB \
 && mvn -pl com.yahoo.ycsb:mongodb-binding -am clean package

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && chmod 700 /etc/bootstrap.sh
ENV BOOTSTRAP /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh", "-d"]
