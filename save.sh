#!/bin/bash

# Informations de connexion au serveur distant
utilisateur="utilisateur"
serveur="ip"
dossier_destination="chemin/vers/le/dossier/de/destination"
mot_de_passe="mot_de_passe"

# Chemin du fichier source à sauvegarder
fichier_source="/chemin/vers/le/fichier.txt"

# Fonction pour sauvegarder le fichier
sauvegarder_fichier() {
    # Connexion au serveur distant et création du dossier de destination si nécessaire
    sshpass -p "$mot_de_passe" ssh "$utilisateur@$serveur" "mkdir -p '$dossier_destination'"

    # Copie du fichier source vers le serveur distant
    if sshpass -p "$mot_de_passe" scp "$fichier_source" "$utilisateur@$serveur:$dossier_destination"; then
        echo "Fichier sauvegardé avec succès."
    else
        echo "Erreur lors de la sauvegarde du fichier."
    fi
}

# Appel de la fonction pour sauvegarder le fichier
sauvegarder_fichier
