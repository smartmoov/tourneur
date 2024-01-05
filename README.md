# Tourneur 

## Installation
Après le clonage du projet et l'activation de l'environnement virtuel, ajoutez les modules nécessaires pour le projet
```shell
pip install -r requirements.txt
```

## Variables d'environnement
Créez le fichier .env
```shell
cp .env.example .env
```
Dans ce fichier, indiquez l'utilisateur (DB_USER) et le mot de passe (DB_PASWWORD) permettant de se connecter à la base de données.
Modifiez éventuellement le nom de la base de donnes (DB_DATABASE)

## Base de données
Le dump SQL permettant de créer la base de données se trouve dans le fichier database/dump.sql

Quelques données sont également présentes pour permettre de faires quelques tests

Vous pouvez insérez les données à l'aide de l'éditeur SQL de adminer ou bien en ligne de commande du moteur SQL

## Lancer le projet
La commande de démarrage du serveur ne se trouve pas dans le fichier app.py mais main.py. Il est donc nécessaire de définir le fichier de démarrage pour Flask
```shell
export FLASK_APP=main
flask run --debug
```
