jPlatformMigrate

Migration type de contenu Bloc de contenu WYSIWYG

Script étape 1 : 
Dans le BO : Espace d'administration -> Exploitation -> Convertir les contenus de Bloc de contenu Wysiwyg
(plugins/MigratePlugin/jsp/wysiwygblock_convert.jsp)


Le script :
 - sélectionne tous les publications
 - sélectionne tous les champs WYSIWYG
 - extrait les liens vers les contenus (expression régulière : URL native JCMS ou URL reécrites par le module SEO)
 - vérifie si le contenu est un lien vers un bloc de contenu WYSIWYG
 - si oui, génère du code HTML qui remplace ce bloc de contenu
 
 Cas :
 - 1 vidéo => URL 
 
 
Script étape 2 : 
Dans le BO : Espace d'administration -> Exploitation -> Analyser les contenus de Bloc de contenu Wysiwyg 
(plugins/MigratePlugin/jsp/wysiwygblock_stats.jsp)

le rapport doit être vide
sinon, générer les cas manuellement, il s'agit de cas non couvert automatiquement