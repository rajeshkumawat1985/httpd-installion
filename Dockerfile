FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip wget unzip -y
RUN wget -O /var/www/html/sbs.zip https://www.free-css.com/assets/files/free-css-templates/download/page295/sbs.zip
WORKDIR /var/www/html
CMD mkdir fun
RUN unzip sbs.zip
RUN cp -rf sbs-html/* . &&\
    rm -rf sbs-html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
