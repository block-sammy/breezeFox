```js
/*
 * BreezeFox 2.0 — HIGH RISK
 *
 * Contient :
 *    Low Risk
 *    Moderate
 *    High Risk
 *
 * Ce profil peut provoquer davantage de problèmes de compatibilité.
 */


/* ================================================================
 *  LOW RISK
 * ================================================================ */

/* Reporting / télémétrie */
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);
user_pref("toolkit.telemetry.archive.enabled", false);

/* Recommandations promotionnelles */
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.trending.featureGate", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);


/* ================================================================
 *  MODERATE
 * ================================================================ */

/* Protection renforcée contre le pistage */
user_pref("browser.contentblocking.category", "strict");

/* HTTPS-Only */
user_pref("dom.security.https_only_mode", true);

/* Préchargement */
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);

/* Études / expériences */
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("nimbus.rollouts.enabled", false);

/* Crash reporting */
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

/* Suggestions supplémentaires */
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.discovery.enabled", false);


/* ================================================================
 *  HIGH RISK
 * ================================================================ */

/*
 * Résistance renforcée au fingerprinting.
 *
 * Peut provoquer des problèmes de compatibilité avec certains sites.
 */
user_pref("privacy.resistFingerprinting", true);


/*
 * DNS over HTTPS — mode TRR uniquement.
 *
 * Firefox utilise le DoH sans fallback DNS classique.
 */
user_pref("network.trr.mode", 3);
```
