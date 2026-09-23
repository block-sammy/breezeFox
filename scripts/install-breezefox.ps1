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

Write-Host "BreezeFox installer" -ForegroundColor Cyan
Write-Host "Profil : $Profile"
Write-Host ""
Write-Host "Fermez Firefox complètement." -ForegroundColor Yellow
Read-Host "Appuyez sur Entrée quand Firefox est fermé"

$roots = @(
  (Join-Path $env:APPDATA "Mozilla/Firefox/Profiles"),
  (Join-Path $env:LOCALAPPDATA "Mozilla/Firefox/Profiles")
) | Where-Object { Test-Path $_ }

$profiles = foreach ($rootPath in $roots) {
  Get-ChildItem $rootPath -Directory -ErrorAction SilentlyContinue
}

if (-not $profiles) {
  throw "Aucun profil Firefox détecté. Utilisez about:profiles pour localiser le dossier."
}

$profiles = @($profiles)

if ($profiles.Count -eq 1) {
  $selected = $profiles[0]
} else {
  Write-Host "Profils détectés :"
  for ($i = 0; $i -lt $profiles.Count; $i++) {
    Write-Host "[$($i + 1)] $($profiles[$i].Name)"
  }

  $choice = Read-Host "Choisissez le numéro du profil"
  if ($choice -notmatch '^[0-9]+$') {
    throw "Choix invalide."
  }

  $index = [int]$choice - 1
  if ($index -lt 0 -or $index -ge $profiles.Count) {
    throw "Choix invalide."
  }

  $selected = $profiles[$index]
}

$target = Join-Path $selected.FullName "user.js"

Write-Host ""
Write-Host "Profil sélectionné : $($selected.FullName)"

if (Test-Path $target) {
  $backup = "$target.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
  Copy-Item $target $backup -Force
  Write-Host "Sauvegarde : $backup" -ForegroundColor DarkCyan
}

Copy-Item $source $target -Force

Write-Host ""
Write-Host "BreezeFox installé dans :" -ForegroundColor Green
Write-Host $target
Write-Host "Redémarrez Firefox pour appliquer les préférences."
