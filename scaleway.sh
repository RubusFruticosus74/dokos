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
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.18.0.%' IDENTIFIED BY 'admin' WITH GRANT OPTION;FLUSH PRIVILEGES;"

bench new-site --no-mariadb-socket --db-name=dokos --db-password=admin --db-host=mariadb --db-root-username=root --db-root-password=admin --admin-password=admin --verbose --force --install-app dokos --install-app hrms --set-default atelier36


    sudo nano /etc/mysql/my.cnf

Lignes de configuration à ajouter à la fin du fichier

# Dodock Install
[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
[mysql]
default-character-set = utf8mb4

#grant access to root from docker netword
#mysql -h 172.17.0.1 -u root -p