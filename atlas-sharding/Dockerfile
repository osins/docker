FROM centos:6

RUN set -ex; 

COPY ./src/Atlas-sharding_1.0.1-el6.x86_64.rpm /tmp/Atlas-sharding_1.0.1-el6.x86_64.rpm
COPY ./conf/default.cnf /usr/local/mysql-proxy/conf/default.cnf

RUN rpm -i  /tmp/Atlas-sharding_1.0.1-el6.x86_64.rpm
RUN rm -rf  /tmp/Atlas-sharding_1.0.1-el6.x86_64.rpm
RUN rm -rf /usr/local/mysql-proxy/conf/test.cnf

# RUN yum install -y mysql

EXPOSE 3306 3307

CMD ["/usr/local/mysql-proxy/bin/mysql-proxyd", "default", "start"]