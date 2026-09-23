# 🍃 BreezeFox 2.0

**Une configuration Firefox simple à comprendre : choisissez votre niveau, installez user.js, redémarrez Firefox.**

> **COMMENCER ICI → [Installation en 60 secondes](#-installation-en-60-secondes)**

BreezeFox est un projet open source qui organise des préférences Firefox de confidentialité en trois niveaux. Le profil par défaut est volontairement léger ; les réglages plus sensibles sont séparés pour que vous puissiez choisir ce que vous acceptez.

## 🟢 Installation en 60 secondes

### Option A — la plus simple

1. Téléchargez le fichier **user.js** à la racine de ce dépôt.
2. Dans Firefox, ouvrez **about:profiles**.
3. Repérez le profil utilisé puis ouvrez son **Répertoire racine / Root Directory**.
4. Fermez Firefox complètement.
5. Placez **user.js** directement dans ce dossier.
6. Relancez Firefox.

Exemple :

    Profil Firefox/
    ├── user.js
    ├── prefs.js
    ├── places.sqlite
    └── ...

Mozilla documente le rôle de user.js et les dossiers de profil : [Assistance Mozilla — Éditeur de configuration Firefox](https://support.mozilla.org/fr/kb/editeur-configuration-firefox).

### Option B — Windows avec l'installateur

Après avoir téléchargé ou cloné le dépôt, ouvrez PowerShell dans son dossier :

    .\scripts\install-breezefox.ps1 -Profile low

Profils disponibles :

    low
    moderate
    high

Le script demande le profil Firefox à utiliser et crée une sauvegarde avant de remplacer un user.js existant.

## 🎚️ Choisir son niveau

| Niveau | Fichier | Contenu | Risque de compatibilité |
|---|---|---|---|
| 🟢 **Low Risk** | **user.js** | Reporting/télémétrie facultatif + recommandations promotionnelles | faible |
| 🟠 **Moderate** | **profiles/moderate.js** | Low Risk + ETP Strict + HTTPS-Only + rapports/expériences | modéré |
| 🔴 **High Risk** | **profiles/high-risk.js** | Moderate + anti-fingerprinting + DoH forcé | élevé |

**Commencez par Low Risk.** Passez à Moderate pour une protection plus stricte. Utilisez High Risk seulement si vous acceptez de tester vos sites et services importants.

Mozilla indique que Resist Fingerprinting peut provoquer le dysfonctionnement de certains sites : [Mozilla — Résister à la prise d'empreintes numériques](https://support.mozilla.org/fr/kb/resist-fingerprinting). Mozilla explique également les exceptions de compatibilité liées à la protection renforcée contre le pistage : [Mozilla — Protection renforcée contre le pistage](https://support.mozilla.org/fr/kb/exceptions-protection-renforcee-contre-pistage).

## 🔐 Que peut-on désactiver ?

BreezeFox ne cache pas les choix dans une énorme liste.

**🟢 Faible risque**
- reporting et télémétrie facultatifs ;
- recommandations promotionnelles.

**🟠 Modéré**
- protection renforcée contre le pistage en mode Strict ;
- HTTPS-Only ;
- préchargements anticipés ;
- certains rapports de crash ;
- certaines expériences.

**🔴 Risque de compatibilité**
- Resist Fingerprinting ;
- DoH forcé.

La matrice détaillée est disponible dans [docs/preferences.md](docs/preferences.md).

## 🔄 Mise à jour

BreezeFox fournit un updater Windows avec :
- lecture de la version distante ;
- identification du commit GitHub courant ;
- téléchargement du profil choisi ;
- calcul SHA-256 du fichier téléchargé ;
- sauvegarde automatique du user.js actuel ;
- remplacement uniquement du fichier user.js.

Vérifier sans modifier :

    .\scripts\update-breezefox.ps1 -Profile low -CheckOnly

Mettre à jour :

    .\scripts\update-breezefox.ps1 -Profile low

Le projet n'exécute pas automatiquement du JavaScript distant dans votre profil.

## ↩️ Désinstaller

1. Fermez Firefox.
2. Supprimez user.js du dossier du profil Firefox.
3. Redémarrez Firefox.

Firefox lit user.js au démarrage. Tant que le fichier reste présent, ses valeurs peuvent être réappliquées.

## 🧩 Vérifier

Ouvrez :

    about:config

ou :

    about:support

Mozilla avertit que about:config contient des réglages avancés pouvant affecter la stabilité, la sécurité et les performances : [Mozilla — about:config](https://support.mozilla.org/fr/kb/editeur-configuration-firefox).

## 📁 Structure

    breezeFox/
    ├── README.md
    ├── user.js
    ├── VERSION
    ├── profiles/
    │   ├── README.md
    │   ├── moderate.js
    │   └── high-risk.js
    ├── docs/
    │   └── preferences.md
    ├── scripts/
    │   ├── install-breezefox.ps1
    │   └── update-breezefox.ps1
    └── .github/
        └── workflows/
            └── validate.yml

## 🛠️ Maintenance

Les préférences Firefox évoluent avec les versions. BreezeFox préfère une liste courte, lisible et documentée à une collection de réglages expérimentaux.

GitHub Actions vérifie la syntaxe de base des user_pref et les doublons sur les fichiers de configuration.

## 📚 Documentation

- [Profils](profiles/README.md)
- [Matrice des préférences](docs/preferences.md)
- [Support Mozilla — profils Firefox](https://support.mozilla.org/fr/kb/profils-la-ou-firefox-conserve-donnees-utilisateur)
- [Support Mozilla — about:config](https://support.mozilla.org/fr/kb/editeur-configuration-firefox)

## 📄 Licence

Voir [LICENSE](LICENSE).
