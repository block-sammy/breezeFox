# BreezeFox profiles

BreezeFox propose trois niveaux de configuration. Copiez **un seul** profil dans le fichier `user.js` de votre profil Firefox.

## Niveaux

- `balanced.js` — recommandé pour commencer : réduction de télémétrie et de contenu promotionnel, avec peu de changements susceptibles d'affecter les sites.
- `privacy.js` — protections supplémentaires contre le pistage et certaines fonctions réseau anticipées.
- `hardened.js` — réglages plus stricts. Certains sites ou fonctions Firefox peuvent ne plus fonctionner comme prévu.

Le choix est volontairement explicite : il n'existe pas de mode caché qui désactive tout.

## Installation

1. Fermez Firefox.
2. Ouvrez `about:support` avant de fermer Firefox et repérez **Dossier de profil**.
3. Placez le contenu du profil choisi dans un fichier nommé `user.js` à la racine du profil.
4. Redémarrez Firefox.

`user.js` est appliqué au démarrage et peut réappliquer ses valeurs après un changement manuel dans `about:config`.

## Retour arrière

Supprimez `user.js` du profil Firefox puis redémarrez Firefox. Pour une préférence précise, vérifiez ensuite `about:config`.

> Les préférences Firefox changent avec les versions. BreezeFox ne promet pas qu'une préférence reste disponible indéfiniment.