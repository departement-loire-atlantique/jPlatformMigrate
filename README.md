# jPlatformMigrate

Ce module permet détaille les étapes à réaliser pour migrer un fichier "store" d'un site vers la nouvelle plateforme JCMS.

Le plugin ajoute des actions d'administration dans JCMS permettant d'automatiser certaines étapes.

## Etape 1 - Ajout d'un prefixe pour les portlets

Afin de valider chaque portlet et portail un par un dans le cadre d'une migration, il est préférable d'ajouter le préfixe [A_VALIDER] devant chaque contenu "portlets" (au sens le plus général).

Pour réaliser cette action, mettre dans le panier les éléments et appliquer la REGEX suivante dans la fonction rechercher et remplacer :
 - Rechercher : `^`
 - Remplacer par : `[ A VALIDER] `
 - Utiliser les expresssions régulières: OUI
 
Ensuite pour chaque portlet, il convient de valider que son intégration graphique et sa configuration sont conformes aux nouvelles spécifications. Une fois réaliser, le préfixe peut être retirer. Si la portlet n'est plus utile, elle peut être supprimée.

## Etape 2 - Migration type de contenu Bloc de contenu WYSIWYG

### Etape 2 - 1 / Conversion

Dans le BO : Espace d'administration -> Exploitation -> Convertir les contenus de Bloc de contenu Wysiwyg
(plugins/MigratePlugin/jsp/wysiwygblock_convert.jsp)

Le script :
 - sélectionne toutes les publications à l'état visible (contenu et portlet)
 - sélectionne tous les champs WYSIWYG
 - extrait les liens vers les contenus (expression régulière : URL native JCMS ou URL reécrites par le module SEO)
 - vérifie si le contenu est un lien vers un bloc de contenu WYSIWYG
 - si oui, génère du code HTML qui remplace ce bloc de contenu
 
Youtube : 
 - Récupère le ou les liens depuis le bloc de contenu Wysiwyg et génère le code HTML <jalios:media data-jalios-source="URL_YOUTUBE" />
 
### Etape 2 - 2 / Vérification

Dans le BO : Espace d'administration -> Exploitation -> Analyser les contenus de Bloc de contenu Wysiwyg 
(plugins/MigratePlugin/jsp/wysiwygblock_stats.jsp)

Le rapport doit être vide. Sinon, générer les cas restant manuellement, il s'agit de cas non couvert par le script automatique.
