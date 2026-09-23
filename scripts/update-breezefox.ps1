param(
  [ValidateSet("low","moderate","high")]
  [string]$Profile = "low",
  [switch]$CheckOnly,
  [switch]$Force
)

$ErrorActionPreference = "Stop"

$repo = "block-sammy/breezeFox"
$raw = "https://raw.githubusercontent.com/$repo/main"
$api = "https://api.github.com/repos/$repo"
$stateDir = Join-Path $env:APPDATA "BreezeFox"
$stateFile = Join-Path $stateDir "installed.json"

$remoteVersion = (Invoke-RestMethod "$raw/VERSION").Trim()
$remoteCommit = (Invoke-RestMethod "$api/commits/main").sha

$installed = $null
if (Test-Path $stateFile) {
  try {
    $installed = Get-Content $stateFile -Raw | ConvertFrom-Json
  } catch {
    $installed = $null
  }
}

Write-Host "BreezeFox update checker" -ForegroundColor Cyan
Write-Host "Version distante : $remoteVersion"
Write-Host "Commit distant   : $remoteCommit"

if ($installed) {
  Write-Host "Version locale   : $($installed.version)"
  Write-Host "Commit local     : $($installed.commit)"
} else {
  Write-Host "Version locale   : non enregistrée"
}

if ($installed -and $installed.commit -eq $remoteCommit) {
  Write-Host ""
  Write-Host "Vous êtes déjà à jour." -ForegroundColor Green
  exit 0
}

if ($CheckOnly) {
  Write-Host ""
  Write-Host "Nouvelle version disponible. Aucun fichier local n'a été modifié." -ForegroundColor Yellow
  exit 0
}

Write-Host ""
Write-Host "Profil demandé : $Profile"

if (-not $Force) {
  $answer = Read-Host "Installer cette version ? (O/N)"
  if ($answer -notmatch '^(o|oui|y|yes)$') {
    Write-Host "Mise à jour annulée."
    exit 0
  }
}

$profileFile = switch ($Profile) {
  "low" { "user.js" }
  "moderate" { "profiles/moderate.js" }
  "high" { "profiles/high-risk.js" }
}

$temp = Join-Path $env:TEMP ("breezfox-" + [guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $temp | Out-Null

try {
  $download = Join-Path $temp "user.js"
  Invoke-WebRequest "$raw/$profileFile" -OutFile $download -UseBasicParsing

  if ((Get-Item $download).Length -lt 20) {
    throw "Le fichier téléchargé est vide ou trop petit."
  }

  $content = Get-Content $download -Raw
  if ($content -notmatch 'user_pref(') {
    throw "Le fichier téléchargé ne ressemble pas à un user.js valide."
  }

  $hash = (Get-FileHash $download -Algorithm SHA256).Hash
  Write-Host "SHA-256 téléchargé : $hash"

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

  $profiles = @($profiles)
  if (-not $profiles) {
    throw "Aucun profil Firefox détecté. Utilisez about:profiles pour localiser le dossier."
  }

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

  if (Test-Path $target) {
    $backup = "$target.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Copy-Item $target $backup -Force
    Write-Host "Sauvegarde : $backup"
  }

  Copy-Item $download $target -Force

  New-Item -ItemType Directory -Force -Path $stateDir | Out-Null
  [pscustomobject]@{
    version = $remoteVersion
    commit = $remoteCommit
    profile = $Profile
    installedAt = (Get-Date).ToUniversalTime().ToString("o")
  } | ConvertTo-Json | Set-Content $stateFile -Encoding UTF8

  Write-Host ""
  Write-Host "BreezeFox mis à jour vers $remoteVersion." -ForegroundColor Green
  Write-Host "Profil : $Profile"
  Write-Host "Redémarrez Firefox."
}
finally {
  Remove-Item $temp -Recurse -Force -ErrorAction SilentlyContinue
}
