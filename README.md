# 🍃 BreezeFox

BreezeFox est une configuration `user.js` pour Mozilla Firefox orientée confidentialité, simplicité et maintenance.

## ✨ Objectifs

- Réduire les fonctions de télémétrie et de rapports facultatifs.
- Désactiver certaines expériences et recommandations promotionnelles.
- Activer la protection renforcée contre le pistage en mode Strict.
- Activer le mode HTTPS uniquement.
- Réduire certains chargements anticipés inutiles.
- Éviter les réglages excessivement agressifs susceptibles de casser des sites.

> **À savoir :** les préférences Firefox évoluent avec les versions. BreezeFox privilégie donc une configuration relativement conservatrice plutôt qu'une longue liste de réglages expérimentaux.

## 📦 Installation

Firefox charge `user.js` depuis le dossier du **profil Firefox**. Mozilla indique que le profil peut être ouvert depuis `about:profiles` ou `about:support`. citeturn0search5turn0search1

### 1. Fermer Firefox

Ferme complètement Firefox avant de modifier son profil.

### 2. Ouvrir le dossier du profil

Dans Firefox, ouvre :

```text
about:profiles
```

Repère le profil utilisé puis ouvre son **Répertoire racine / Root Directory**.

### 3. Installer le fichier

Copie le fichier `breezeFox` du dépôt dans ce dossier et renomme-le en :

```text
user.js
```

Le fichier doit donc être placé directement dans le dossier du profil.

### 4. Redémarrer Firefox

Relance Firefox pour appliquer la configuration.

## 🔄 Comprendre `user.js`

Firefox lit `user.js` au démarrage et réapplique les préférences qui y sont définies. Cela signifie qu'une modification faite dans `about:config` peut être remplacée au prochain démarrage si la même préférence est définie dans `user.js`. citeturn0search1turn0search10

Pour retirer BreezeFox, ferme Firefox puis supprime `user.js` du profil. Les préférences ne seront alors plus réappliquées par ce fichier.

## 🛡️ Ce que BreezeFox modifie

| Catégorie | Configuration |
|---|---|
| Télémétrie | Réduction/désactivation de plusieurs mécanismes facultatifs |
| Expériences | Désactivation de Shield/Normandy/Nimbus configurés dans le fichier |
| Tracking | Protection renforcée en mode Strict |
| HTTPS | Mode HTTPS uniquement |
| Préchargement | Réduction du prefetch DNS/page |
| Suggestions | Réduction des suggestions promotionnelles |
| IA/ML | Désactivation des préférences IA présentes dans la configuration |

## ⚠️ Compatibilité

BreezeFox ne promet pas qu'aucun site ne rencontrera de problème. Certaines protections Firefox peuvent modifier le comportement de sites qui dépendent de fonctions de suivi ou de contenus tiers.

Après une mise à jour importante de Firefox, il est recommandé de vérifier le comportement du navigateur et les préférences définies dans `user.js`.

## 📁 Structure

```text
breezeFox/
├── README.md
└── breezeFox
```

Le fichier `breezeFox` est le `user.js` à installer dans le profil Firefox.

## 📚 Documentation

- [Profils Firefox — Assistance Mozilla](https://support.mozilla.org/fr/kb/profils-la-ou-firefox-conserve-donnees-utilisateur)
- [À propos de `user.js` — Assistance Mozilla](https://support.mozilla.org/en-US/questions/1261139)

## 📄 Licence

Voir la licence du dépôt.
