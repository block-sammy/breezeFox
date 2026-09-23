/*
 * BreezeFox 2.0 — MODERATE
 *
 * Profil intermédiaire : plus strict que le profil racine, mais sans
 * les réglages les plus susceptibles de casser des sites.
 *
 * Installation : copier CE fichier sous le nom user.js dans le profil
 * Firefox. Ne fusionnez pas ce fichier avec un autre user.js sans vérifier
 * les doublons de préférences.
 */

/* =========================
 * REPORTING / TÉLÉMÉTRIE
 * ========================= */
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);

/* =========================
 * ÉTUDES / EXPÉRIENCES
 * ========================= */
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("nimbus.rollouts.enabled", false);

/* =========================
 * CRASH REPORTING
 * ========================= */
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

/* =========================
 * PROTECTION
 * ========================= */
user_pref("browser.contentblocking.category", "strict");
user_pref("dom.security.https_only_mode", true);
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);

/* =========================
 * SUGGESTIONS / PROMOTION
 * ========================= */
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.trending.featureGate", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.discovery.enabled", false);

/*
 * Les préférences expérimentales IA/ML ne sont PAS forcées ici :
 * leurs noms et leur comportement peuvent changer entre versions de Firefox.
 */
