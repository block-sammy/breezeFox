# BreezeFox — lightweight local checker
# Run from the repository root in PowerShell.
$files = Get-ChildItem -Path . -Recurse -Filter *.js
$bad = @()
foreach ($file in $files) {
  $text = Get-Content $file.FullName -Raw
  if ($text -match '(?m)^\s*user_pref\(' -and $text -notmatch '(?m)^\s*user_pref\("') {
    $bad += $file.FullName
  }
}
if ($bad.Count -gt 0) {
  Write-Error "Possible malformed user_pref entries: $($bad -join ', ')"
  exit 1
}
Write-Host "BreezeFox check passed: basic user_pref structure looks valid."
