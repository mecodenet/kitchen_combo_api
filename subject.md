# Problème

J'attends des amis pour le diner mais je n'ai pas le temps de faire des courses. Sachant ce que j'ai dans mon frigo, qu'est-ce que je peux préparer ?

# Objectif

Réaliser un prototype d'application qui permette de répondre ci-dessus.

Par prototype, nous entendons:

* qu'il soit utilisable en restant aussi simple que possible
* nous accordons peu d'importance au visuel
* nous n'attendons pas de complexit;e qui ne réponde pas au besoin fonctionnel primordial de l'app

Avec ce prototype, nous nous attendons à povuoir discuter de l'implémentation et des possibilit;es d'amélioration et d'idées pour aller plus loin.

## Impératifs tech

* Msql ou PostgreSQL
* Backend-end qui réponde aux requetes
* Interface web (aussi minimaliste soit elle)

## En bonus

* Ruby on rails
* React

# Données

Le fichier recipes.json contient environ 9500 recettes de cuisines extraites du site marmiton.org

Chaque ligne contient une entrée au format json, extraite grave au paquet python-marmiton. Le format de ces entrées est décrit dans le README du paquet.

NB : la clé steps a été supprimée de ces entrées, pour réduire le poids du fichier.

# Livrable

* Les 2-3 users stories auxquelles répond l'application
* la codebase : dans un repo git ou à défaut dans un fichier ZIP
* la structure de base de données
* L'application: en ligne sur keroku ou un serveur perso. A defaut, une video de démonstration et des instructions pour pouvoir l'éxécuter localement.

