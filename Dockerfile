FROM centos:centos7.9.2009

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

ARG user=dev

LABEL Env=DEV
LABEL Client=Hippo

RUN yum update -y

RUN yum install -y httpd unzip 

WORKDIR /var/www/html/

ENV TEST=templatemo_625_folio_slideshow 

ADD https://templatemo.com/download/$TEST .

RUN mv $TEST $TEST.zip && unzip $TEST.zip && mv $TEST/* .

RUN useradd $user && chown $user:$user -R .

RUN rm -rf $TEST*

VOLUME /var/log/httpd

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:80/ || exit 1

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
