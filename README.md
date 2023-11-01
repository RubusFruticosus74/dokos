# dokos
test of the dokos ERP using docker : [Voir la documentation](https://doc.dokos.io/dodock/installation/docker) 

Pour lancer les containers:
> docker-compose up
Pour les stopper:
> docker-compose down

Pour se connecter à l'install: administrator/admin (pensez à changer le mot de passe et de créer un nouveau login admin)

Pour le framework frappe, il y a un repo qui permet de le tester sur docker: https://github.com/frappe/frappe_docker/
par contre pour lancer le truc, il faut renommer le example.env en .env et utiliser le fichier pwd.yml comme ceci:
docker-compose -f pwd.yml up
