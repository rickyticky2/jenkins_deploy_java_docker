FROM docker tomcat:jdk8
ADD  ./target/hello-1.0.war /usr/local/tomcat/webapps/
