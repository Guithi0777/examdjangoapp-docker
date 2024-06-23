#!/bin/bash

# Répertoire à surveiller
repo1="/data"

# Répertoire de destination
repo2="/data/backupsqlite"

# Boucle infinie pour surveiller les modifications
while true; do
    # Utilisation de l'utilitaire inotifywait pour surveiller les modifications dans le répertoire
    change=$(inotifywait -r -e modify,move,create,delete $repo1 2>/dev/null)
    # Récupération du chemin du fichier modifié
    fichier_modifie=$(echo $change | awk '{print $NF}')
    # Copie du fichier modifié vers le répertoire de destination
    cp "$fichier_modifie" "$repo2"
    echo "Le fichier $fichier_modifie a été copié dans $repo2."
done