README - Projet Infrastructure

Ce README fournit un guide étape par étape pour configurer votre projet d'infrastructure. Suivez les instructions ci-dessous pour 
installer les prérequis, créer le script de sauvegarde, configurer le crontab et lancer le serveur. Vous trouverez également des informations 
sur la vérification des sauvegardes à l'aide du fichier de log.

Prérequis

Assurez-vous d'installer les packages suivants avant de commencer :

openssh
sshpass
ufw

Étape 1 : Configuration du script de sauvegarde

Créez un script de sauvegarde personnalisé pour le fichier ou le dossier que vous souhaitez sauvegarder sur la machine virtuelle de base.
Assurez-vous également de configurer un fichier de log pour enregistrer les résultats des sauvegardes.

Exemple de commande à ajouter au fichier crontab en utilisant crontab -e :

* * * * * /chemin/vers/votre/script.sh >> /chemin/vers/votre/log/save.log 2>&1

Étape 2 : Configuration du serveur

Pour lancer le serveur, suivez les étapes ci-dessous :

Mettez les deux machines virtuelles en mode bridge pour permettre une communication entre elles.
Sur les deux machines virtuelles, lancez le service OpenSSH pour activer les connexions sécurisées via SSH avec la commande sudo service ssh start.
Autorisez le port 22 en utilisant la commande ufw allow 22.
Activez le pare-feu UFW en utilisant la commande ufw enable.
Sur la machine virtuelle distante, utilisez la commande ip addr show pour récupérer l'adresse IP du serveur distant.
Utilisez la commande sudo ssh utilisateur@adresse_ip pour vous connecter au serveur distant en remplaçant utilisateur par votre nom d'utilisateur 
et adresse_ip par l'adresse IP récupérée précédemment.

Étape 3 : Vérification des sauvegardes

Une fois connecté au serveur distant, le script de sauvegarde se mettra en route selon la planification définie dans le fichier crontab. 
Pour vérifier si la sauvegarde est réussie, consultez le fichier de log spécifié lors de la configuration du script de sauvegarde.

chemin/vers/votre/log/save.log
Consultez le contenu du fichier de log pour vérifier les résultats des sauvegardes et vous assurer que tout fonctionne comme prévu.
