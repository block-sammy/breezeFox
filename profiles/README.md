# Profils BreezeFox

Choisissez **un seul** profil et copiez son contenu dans le dossier du profil Firefox sous le nom **user.js**.

| Profil | Objectif | Risque de compatibilité |
|---|---|---|
| **Low Risk** — user.js | Base légère : télémétrie facultative + recommandations promotionnelles | 🟢 faible |
| **Moderate** — profiles/moderate.js | Plus de protection : ETP Strict, HTTPS-Only, crash/expériences | 🟠 modéré |
| **High Risk** — profiles/high-risk.js | Durcissement avancé, anti-fingerprinting et DoH forcé | 🔴 élevé |

## Low Risk

Utilisez le fichier **user.js** situé à la racine du dépôt.

Il réduit principalement certains mécanismes de reporting/télémétrie et plusieurs recommandations promotionnelles, sans imposer les réglages les plus sensibles.

## Moderate

Utilisez **profiles/moderate.js**.

Il ajoute notamment la Protection renforcée contre le pistage en mode Strict, HTTPS-Only et des réglages supplémentaires de reporting/expériences.

## High Risk

Utilisez **profiles/high-risk.js**.

Il reprend Moderate et ajoute :

- **privacy.resistFingerprinting = true**
- **network.trr.mode = 3**

Mozilla indique que Resist Fingerprinting peut provoquer des dysfonctionnements sur certains sites. Le DoH forcé peut aussi être inadapté à certains réseaux.

## Retour arrière

1. Fermez Firefox.
2. Supprimez **user.js** du dossier de profil.
3. Redémarrez Firefox.

Firefox lit **user.js** au démarrage : garder le fichier en place peut donc réappliquer les valeurs à chaque lancement.
