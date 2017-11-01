FROM tomcat:alpine

MAINTAINER Michael Pritchin <pritchinmihail@gmail.com>

RUN apk update
RUN apk add git

RUN git clone https://github.com/mpritchin/docker-test-java-hello-world

WORKDIR docker-test-java-hello-world

RUN [ "chmod", "+x", "./gradlew" ]
RUN [ "./gradlew", "war" ]

RUN cp build/libs/helloworld-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/helloworld.war

CMD ["catalina.sh", "run"]
