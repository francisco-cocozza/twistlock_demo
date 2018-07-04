
FROM ubuntu:12.04

MAINTAINER Francisco Cocozza

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN echo "date: $(date)" >> /var/www/index.html

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Comment next line to ADD a Compliance Vulnerability
#RUN rm /etc/ssl/private/ssl-cert-snakeoil.key

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
