# Cinema Service API

API Django REST pour gérer un service de cinéma : films, acteurs, genres, salles, séances, commandes et tickets.

## Structure du projet

```txt
.
├── Dockerfile
├── docker-compose.yml
├── .env
├── manage.py
├── requirements.txt
├── cinema_service/
├── cinema/
└── user/
```
## Dockerfile

Le Dockerfile crée une image Python de développement :

1. utilise `python:3.12-slim`
2. définit `/app_dev` comme dossier de travail
3. met `pip` à jour
4. copie `requirements.txt`
5. installe les dépendances depuis `requirements.txt`
6. installe aussi `django` (et autres dépendances si nécessaire)
7. lance `bash` par défaut

Important : Django ne démarre pas automatiquement.

Pour lancer Django :

python manage.py runserver 0.0.0.0:7777

## docker-compose.yml

Le compose lance 3 services :

### postgres

Base PostgreSQL :

- user : melissa
- password : tasnime
- database : mydb
- port : 5432
- volume : ./postgres_data

### pgadmin

Interface web pour gérer PostgreSQL.

Accès :

http://localhost:8081

Identifiants :

- email : melissa@tasnime.com
- password : admin

### backend

Conteneur Django de développement.

Il :

- build l’image depuis le Dockerfile
- monte le projet dans `/app_dev`
- expose le port `7777`
- dépend de PostgreSQL
- démarre en mode terminal interactif ( pour acceder au terminal : docker exec -it backend bash)

## Lancer le projet

docker compose up --build

Puis entrer dans le backend :

docker compose exec backend bash

Appliquer les migrations :

python manage.py migrate


<!-- Créer un admin :

python manage.py createsuperuser -->
on peut la passer cette etape si on a pas besoin dutilise django admin

Lancer Django :

python manage.py runserver 0.0.0.0:7777 
<!-- 0.0.0.0 pas local host pour que le contenaire ecoute depuis toute les interfaces -->

Puis ouvrir :
Swagger :

http://localhost:7777/api/doc/swagger/

## Features

* Swagger Documentation
* JWT authentication
* Admin panel
* Managing orders and tickets
* Creating movies with genres, actors
* Creating cinema halls instances
* Adding movie sessions
* Filtering movies and movie sessions by title, genres, movies
* User and superuser functionality
