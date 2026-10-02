sudo apt update
sudo apt install wget git maven -y
mvn --version
cd /opt/
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.122/bin/apache-tomcat-9.0.122.tar.gz
ls
sudo tar -xvf apache-tomcat-9.0.122.tar.gz
ls
sudo mv apache-tomcat-9.0.122 tomcat
ls
sudo rm -rf *.tar.gz
ls
ls -l
sudo chown duser:duser -R tomcat/
cd tomcat/
ls -l
cd bin/
ls
ls -l
chmod +x shutdown.sh startup.sh
ls -l
cd ..
ls
cd conf/
ls

vi server.xml
    ##  <Connector port="8888" protocol="HTTP/1.1"

ls

vi tomcat-users.xml
    ## <user username="admin" password="admin" roles="manager-gui,manager-script,admin-gui"/>

cd ../bin
ls -ll
./shutdown.sh
./startup.sh
sudo ln -s /opt/tomcat/bin/startup.sh /usr/local/bin/tomcatup
sudo ln -s /opt/tomcat/bin/shutdown.sh /usr/local/bin/tomcatdown
ls /usr/local/bin/
ls -l /usr/local/bin/
tomcatdown
tomcatup
cd ../conf/
ls
cd ..

find /opt/tomcat -name context.xml

vi /opt/tomcat/webapps/host-manager/META-INF/context.xml
## <!--  <Valve className="org.apache.catalina.valves.RemoteCIDRValve"
  allow="127.0.0.0/8,::1/128" /> -->

vi /opt/tomcat/webapps/manager/META-INF/context.xml
## <!--  <Valve className="org.apache.catalina.valves.RemoteCIDRValve"
  allow="127.0.0.0/8,::1/128" /> -->
  
tomcatdown
tomcatup

# https://www.jenkins.io/doc/book/installing/linux/

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]"   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
