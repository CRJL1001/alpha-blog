# README

## Projet de Blog comprenant les fontionalités:
    - Rédaction, édition, suppression d'articles
    - Création, Connexion à un compte sécurisés
    - Création, modification de catégories

## Spécificités:
    - Relations Many-To-Many articles <-> catégories
    - Relation One-To-Many articles <-> utilisateur
    - Sécurisation avec Bcrypt
    - base de données SQlite3, (PgSQL en production)
    - Bootstrap CSS, JS
    - RubyOnRails
    - Jeux de tests

## Environment de développement: 
    - WSL Unbuntu sous Windows 11 Pro

## Lien Docker Hub : 
    - https://hub.docker.com/r/crjl1001/blog_app
    - docker pull crjl1001/blog_app


### Ruby version -> ruby 3.4.5 (2025-07-16 revision 20cda200d3) +PRISM [x86_64-linux]

### System dependencies -> Git, Node.js >= 20, Docker/Docker Compose

### Configuration
    - Vous pouvez créer un utilisateur admin via la console rails "rails console" avec user = User.new(username: "admin",email: "admin@exemple.fr",password: "Test",admin: true)
    - Sinon utiliser le site

### Tests -> rails test



