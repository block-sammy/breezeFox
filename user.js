/*
 * BreezeFox 2.0 — default user.js
 *
 * PROFIL PAR DÉFAUT : LOW RISK
 *
 * Installation :
 *   1. Fermer Firefox.
 *   2. Placer ce fichier à la racine du profil Firefox.
 *   3. Redémarrer Firefox.
 *
 * Pour les profils plus stricts :
 *   profiles/moderate.js
 *   profiles/high-risk.js
 *
 * Important : Firefox lit user.js au démarrage. Une préférence déclarée
 * ici peut donc être réappliquée au prochain démarrage.
 */

/* ================================================================
 * LOW RISK — télémétrie / collecte facultative
 * ================================================================ */

user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);
user_pref("toolkit.telemetry.archive.enabled", false);

/* ================================================================
 * LOW RISK — recommandations promotionnelles
 * ================================================================ */

user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.trending.featureGate", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

/*
 * Les réglages plus sensibles sont volontairement séparés afin de
 * simplifier le choix du niveau et le dépannage.
 */
