FROM registry.redhat.io/ubi8

RUN yum --disableplugin=subscription-manager -y module enable php:7.2 \
  && yum --disableplugin=subscription-manager -y install httpd \
  && yum --disableplugin=subscription-manager -y install php php-pdo php-mysqlnd \
  && yum --disableplugin=subscription-manager -y install procps-ng \
  && yum --disableplugin=subscription-manager -y install iputils net-tools \
  && yum --disableplugin=subscription-manager clean all

COPY html/ /var/www/html/

RUN sed -i 's/Listen 80/Listen 0.0.0.0:8888/' /etc/httpd/conf/httpd.conf \
  && mkdir /run/php-fpm \
  && chgrp -R 0 /var/log/httpd /var/run/httpd /run/php-fpm \
  && chmod -R g=u /var/log/httpd /var/run/httpd /run/php-fpm
  
EXPOSE 8888

# USER 1001

ENV MYSQL_ROOT_PASSWORD=root
# ENV DB_SERVER=mysql

CMD php-fpm & httpd -D FOREGROUND

