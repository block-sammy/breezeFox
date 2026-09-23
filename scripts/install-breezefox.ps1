param(
  [ValidateSet("low","moderate","high")]
  [string]$Profile = "low"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot

$source = switch ($Profile) {
  "low" { Join-Path $root "user.js" }
  "moderate" { Join-Path $root "profiles/moderate.js" }
  "high" { Join-Path $root "profiles/high-risk.js" }
}

if (-not (Test-Path $source)) {
  throw "Profil introuvable : $source"
}

Write-Host "BreezeFox installer"
Write-Host "Profil choisi : $Profile"
Write-Host ""
Write-Host "Fermez Firefox complètement avant de continuer." -ForegroundColor Yellow
Read-Host "Appuyez sur Entrée quand Firefox est fermé"

$roots = @(
  (Join-Path $env:APPDATA "Mozilla/Firefox/Profiles"),
  (Join-Path $env:LOCALAPPDATA "Mozilla/Firefox/Profiles")
) | Where-Object { Test-Path $_ }

$profiles = foreach ($rootPath in $roots) {
  Get-ChildItem $rootPath -Directory -ErrorAction SilentlyContinue
}

if (-not $profiles) {
  throw "Aucun profil Firefox détecté. Utilisez about:profiles pour trouver votre profil."
}

$profilePath = $profiles |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 1

$target = Join-Path $profilePath.FullName "user.js"

if (Test-Path $target) {
  $backup = "$target.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
  Copy-Item $target $backup -Force
  Write-Host "Sauvegarde créée : $backup" -ForegroundColor Cyan
}

Copy-Item $source $target -Force

Write-Host ""
Write-Host "BreezeFox est installé :" -ForegroundColor Green
Write-Host $target
Write-Host ""
Write-Host "Redémarrez Firefox pour appliquer les préférences."
