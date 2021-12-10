FROM docker pull tomcat:jdk8
ADD  ./target/hello-1.0.war /usr/local/tomcat/webapps/
