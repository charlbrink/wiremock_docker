FROM java:8
MAINTAINER ika@melexis.com

USER root

ADD wiremock-standalone-2.19.0.jar /app/wiremock-standalone-2.19.0.jar
ADD wiremock_run.sh /app/wiremock_run.sh

CMD ["/app/wiremock_run.sh"]

