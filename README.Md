#### Le but de ce projet est de développer une application de gestion de tâches (to-do list) permettant aux employés d'ajouter des tâches de leur choix. L'application sera dotée d'une base de données pour faciliter la communication entre les managers et les employés. L'objectif principal est d'éviter l'encombrement des boîtes mail avec des tâches de moindre importance, telles que la réorganisation de la salle de réunion ou le rangement des chaises, qui risquent d'être négligées lors de la consultation de mails plus importants.

### Le conteneur django-app est mon applciation sous le framework django avec la base de donnés "sqlite".

### Le conteneur sqlite3-part est fait pour qu'un admin sys puisse travailler en local en communiquer avec la base de donnés sqlite3 , comme volumes qui communique. Ma base de donnés de l'image de mon application communique avec le volume sqlite_data

### dnsmasq va venir projeter mon site port avec l'adresse 127.0.0.1:8000 sous testgtexam.com

### Le conteneur ssh-grafana-part contient mon grafana et openssh-client pour au cas ou surveilelr a distance notre infrastructure.

### Pour isoler mon infrastrucutre j'ai crée une réseaux "docker_net_gt2" pour que mes conteneurs communiquent entre eux.


### Le managers lui a accés sur le containeur docker nommer "ssh-grafana-part" lui pourra se connecter a distance pour avoir un oeil sur l'état du service , l'état du site ect.. Il pourra integrer des accés avec la base de donnés sqlite3 qui elle communiquera a travers le volumes de l'applications "django" ou est crée notre todolist qui cette todolist est exposer via un dns privée.

## L'appplication est exposer avc un reverse proxy avec dnsmasq qui écoute sur l'app. La seule chose qu'elle expose publiquement c'est son masque dns.

# Chaque container est relier entre eux avec une connexion internet priver nommer "docker_net_gt2" qui elle relie tout mes container et chacuns d'entre eux communique ensemble .

Mise en place du Projet : 

- Avant toutes choses il est nécéssaire d'avoir comme logiciel installer sur son shell : Docker compose avec Docker CLI avec Openssh , il sera nécéssaire de suivre cet installation :

sudo apt update && \
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
sudo apt update && \
sudo apt install -y docker-ce docker-ce-cli containerd.io \
sudo apt install openssh-server -y \
systemctl status docker 

- Aprés mettons en place le projet.

docker-compose up 

-














