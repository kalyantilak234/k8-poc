#Base image for the container
FROM tomcat:7-jre8

#RUN wget http://mirror.centos.org/centos/7/os/x86_64/Packages/yum-3.4.3-154.el7.centos.noarch.rpm && \
 #   rpm -ivh yum-3.4.3-154.el7.centos.noarch.rpm

RUN apt-get -qq update && apt-get install --no-install-recommends -qqy curl ca-certificates git ssh

RUN mkdir -p /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
#COPY ~/.ssh/id_rsa ~/.ssh/id_rsa


#ARG SSH_KEY
#RUN echo "${SSH_KEY}" >> /root/.ssh/id_rsa.pub

#RUN wget http://mirror.centos.org/centos/7/os/x86_64/Packages/yum-3.4.3-154.el7.centos.noarch.rpm
#rpm -ivh yum-3.4.3-154.el7.centos.noarch.rpm

# Clone our private GitHub Repository
RUN mkdir -p ~/myapp
#RUN git clone -b docker git@github.com:devopstrainer2017/sym.git ~/myapp
RUN wget -O ~/myapp/helloworld.war https://app.box.com/s/13vcivyc7hswf0auntks9dzfmcno7frj
RUN cp -R ~/myapp/* /usr/local/tomcat/webapps/

EXPOSE 8080
CMD chmod +x /usr/local/tomcat/bin/catalina.sh
CMD ["catalina.sh", "run"]
