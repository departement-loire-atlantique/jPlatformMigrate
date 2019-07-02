jPlatformMigrate

Migration type de contenu Bloc de contenu WYSIWYG

Script étape 1 : 
Dans le BO : Espace d'administration -> Exploitation -> Convertir les contenus de Bloc de contenu Wysiwyg
(plugins/MigratePlugin/jsp/wysiwygblock_convert.jsp)


Le script :
 - sélectionne toutes les publications à l'état visible (contenu et portlet)
 - sélectionne tous les champs WYSIWYG
 - extrait les liens vers les contenus (expression régulière : URL native JCMS ou URL reécrites par le module SEO)
 - vérifie si le contenu est un lien vers un bloc de contenu WYSIWYG
 - si oui, génère du code HTML qui remplace ce bloc de contenu
 
 

Youtube :
Récupère le ou les liens depuis le bloc de contenu Wysiwyg et génère le code HTML <jalios:media data-jalios-source="URL_YOUTUBE" />

 
Flickr :
 
 
Script étape 2 : 
Dans le BO : Espace d'administration -> Exploitation -> Analyser les contenus de Bloc de contenu Wysiwyg 
(plugins/MigratePlugin/jsp/wysiwygblock_stats.jsp)

le rapport doit être vide
sinon, générer les cas manuellement, il s'agit de cas non couvert automatiquement