## Démarrer le serveur

```php -S 127.0.0.1:8000 -t public```
ou 
```symfony server:start```

http://127.0.0.1:8000

## Packages
* Pour utiliser des fonctionnalités avec commentaires :

```composer require annotations```
* Pour utiliser des templates html :

```composer require twig```

* Pour utiliser une BDD :

```composer require symfony/orm-pack```

```composer require --dev symfony/maker-bundle```

* Gestion des assets (css/image/js) :

```composer require symfony/asset```

* Envoyer des mails :

```composer require symfony/mailer```

```composer require symfony/google-mailer```

## BDD

* Dans le fichier .env :
```
DATABASE_URL="mysql://root:root@127.0.0.1:8889/companmailer"
```

* créer la BDD avec doctrine
```
php bin/console doctrine:database:create

php bin/console make:entity

php bin/console make:migration  
php bin/console doctrine:migrations:migrate
```

## Utiliser des assets

* Mettre les assets dans le dossier ```public```
```php
<link href="{{ asset('css/blog.css') }}" rel="stylesheet"/>
```
* Désactiver le cache (pour le css) dans ```config/packages/twig.yaml```
```
twig:
    cache: false
```

## Envoyer un mail avec gmail
* désactiver la double authentification
* autorisé les "less secure apps"
  https://support.google.com/accounts/answer/6010255?hl=en#zippy=%2Cif-less-secure-app-access-is-on-for-your-account