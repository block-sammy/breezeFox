/*
 * BreezeFox 2.0 — HIGH RISK
 *
 * Profil de durcissement avancé.
 * Utilisez-le uniquement si vous acceptez des problèmes possibles
 * de compatibilité avec certains sites ou services.
 */

/* Base Moderate */
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
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("nimbus.rollouts.enabled", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.contentblocking.category", "strict");
user_pref("dom.security.https_only_mode", true);
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.trending.featureGate", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.discovery.enabled", false);

/*
 * HIGH RISK — Resist Fingerprinting.
 * Mozilla indique que ce réglage peut provoquer des dysfonctionnements
 * sur certains sites.
 */
user_pref("privacy.resistFingerprinting", true);

/*
 * HIGH RISK — force DNS over HTTPS uniquement.
 * Peut être inadapté à certains réseaux, VPN, contrôles parentaux ou
 * environnements d'entreprise.
 */
user_pref("network.trr.mode", 3);
