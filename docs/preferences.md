# Matrice des préférences

BreezeFox classe les préférences par risque afin que l'utilisateur puisse choisir sans parcourir une longue liste.

## Low Risk

| Préférence | Fonction |
|---|---|
| datareporting.policy.dataSubmissionEnabled | contrôle la soumission du reporting |
| datareporting.healthreport.uploadEnabled | contrôle l'envoi Health Report |
| datareporting.usage.uploadEnabled | contrôle l'envoi de données d'usage |
| toolkit.telemetry.archive.enabled | contrôle l'archivage local de télémétrie |
| browser.urlbar.quicksuggest.enabled | désactive Quick Suggest |
| browser.newtabpage.activity-stream.showSponsored | retire les contenus sponsorisés |

## Moderate

| Préférence | Fonction |
|---|---|
| browser.contentblocking.category = strict | ETP Strict |
| dom.security.https_only_mode = true | HTTPS-Only |
| network.prefetch-next = false | réduit le préchargement de pages |
| network.dns.disablePrefetch = true | réduit le préchargement DNS |
| app.shield.optoutstudies.enabled = false | désactive les études Shield |
| app.normandy.enabled = false | désactive Normandy |

## High Risk

| Préférence | Fonction |
|---|---|
| privacy.resistFingerprinting = true | résistance renforcée au fingerprinting |
| network.trr.mode = 3 | DoH forcé |

Le classement décrit principalement le risque de compatibilité et de maintenance. Ce n'est pas une note de qualité.

Les préférences Firefox peuvent changer au fil des versions. Une préférence devenue inconnue peut être ignorée par Firefox.
