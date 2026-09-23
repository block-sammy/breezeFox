param(
  [ValidateSet("low","moderate","high")]
  [string]$Profile = "low",
  [switch]$CheckOnly
)

$ErrorActionPreference = "Stop"
$repo = "block-sammy/breezeFox"
$raw = "https://raw.githubusercontent.com/$repo/main"
$api = "https://api.github.com/repos/$repo"

$remoteVersion = (Invoke-RestMethod "$raw/VERSION").Trim()
$remoteCommit = (Invoke-RestMethod "$api/commits/main").sha

Write-Host "BreezeFox version distante : $remoteVersion"
Write-Host "Commit distant             : $remoteCommit"
Write-Host ""

if ($CheckOnly) {
  Write-Host "Vérification terminée. Aucun fichier local n'a été modifié."
  exit 0
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

  $hash = (Get-FileHash $download -Algorithm SHA256).Hash
  Write-Host "SHA-256 téléchargé : $hash"

  $roots = @(
    (Join-Path $env:APPDATA "Mozilla/Firefox/Profiles"),
    (Join-Path $env:LOCALAPPDATA "Mozilla/Firefox/Profiles")
  ) | Where-Object { Test-Path $_ }

  $profiles = foreach ($rootPath in $roots) {
    Get-ChildItem $rootPath -Directory -ErrorAction SilentlyContinue
  }

  if (-not $profiles) {
    throw "Aucun profil Firefox détecté."
  }

  $profilePath = $profiles |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

  $target = Join-Path $profilePath.FullName "user.js"

  if (Test-Path $target) {
    $backup = "$target.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Copy-Item $target $backup -Force
    Write-Host "Sauvegarde créée : $backup"
  }

  Copy-Item $download $target -Force

  Write-Host ""
  Write-Host "Mise à jour terminée vers $remoteVersion." -ForegroundColor Green
  Write-Host "Commit : $remoteCommit"
  Write-Host "Redémarrez Firefox."
}
finally {
  Remove-Item $temp -Recurse -Force -ErrorAction SilentlyContinue
}
