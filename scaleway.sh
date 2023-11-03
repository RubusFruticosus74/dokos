#install mariadb
apt update && apt install -y mariadb-server mariadb-client
#install docker
curl -fsSL https://get.docker.com | bash
ifconfig #get docker Host IP ip, should be 172.17.0.1
#Créer le fichier de configuration .my.conf 
touch ~/.my.cnf
echo -e "[client]\nuser=root\npassword=" > ~/.my.cnf
chmod 600 ~/.my.cnf
#Ask mysql to listen on all interfaces (it's 127.0.0.1 by default)m
echo -e "[mysqld]\nbind-address = 0.0.0.0" >> /etc/mysql/my.cnf
#restart service
service mariadb restart

#execute SQL command using credential in .my.cnf
<<<<<<< HEAD
mysql -e "	"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.18.0.%' IDENTIFIED BY 'admin' WITH GRANT OPTION;FLUSH PRIVILEGES;"
=======
mysql -e "	"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.19.0.%' IDENTIFIED BY 'admin';FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.18.0.%' IDENTIFIED BY 'admin';FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'dokos'@'172.18.0.%' IDENTIFIED BY 'dokosdbpassword1';FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'frappe'@'172.%.%.%' IDENTIFIED BY 'admin';FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON _5e5899d8398b5f7b.* TO 'root'@'172.18.0.%' IDENTIFIED BY 'admin';FLUSH PRIVILEGES;"

bench new-site --no-mariadb-socket --mariadb-root-password admin --admin-password admin dokos
>>>>>>> 642646261d004ef83cebc20c3a276de8c0fd85e6

#creation du site
bench new-site --no-mariadb-socket --db-name=dokos --db-password=admin --db-host=mariadb --db-root-username=root --db-root-password=admin --admin-password=admin --verbose --force --install-app dokos --install-app hrms --set-default atelier36


UPDATE mysql.user SET Host = '%' where User = 'dokos'; FLUSH PRIVILEGES;
SET PASSWORD FOR 'dokos'@'%' = PASSWORD('admin'); FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON 'dokos'.* TO 'dokos'@'%'; FLUSH PRIVILEGES;
EXIT;

#grant access to root from docker netword
#mysql -h 172.17.0.1 -u root -p