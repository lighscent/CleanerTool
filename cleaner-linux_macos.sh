#!/bin/bash

echo "CleanerTool - Version Linux/MacOS"
echo "==================================="

# Vérification des droits d'administration
if [ "$EUID" -ne 0 ]; then
    echo "Vous devez exécuter ce script en tant qu'administrateur (root)."
    exit 1
fi

# Fonction pour demander une confirmation
confirmation() {
    read -p "Voulez-vous vraiment supprimer ces fichiers et dossiers ? (O/N): " response
    case "$response" in
        [oO]|[oO][uU][iI]|[yY])
            cleanup
            ;;
        *)
            echo "Annulation de l'opération."
            exit 0
            ;;
    esac
}

# Nettoyage des fichiers et dossiers
cleanup() {
    echo "Nettoyage en cours..."

    # Liste des répertoires de fichiers temporaires
    cleanup_dirs=("/tmp" "/var/tmp" "/usr/tmp" "/private/var/tmp")

    for dir in "${cleanup_dirs[@]}"; do
        if [ -d "$dir" ]; then
            echo "Suppression de $dir/*..."
            rm -rf "$dir"/*
        fi
    done

    echo "Nettoyage terminé."
    exit 0
}

# Demander la confirmation
confirmation
