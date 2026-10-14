$ErrorActionPreference = 'Stop'
$tools = "C:\Users\lansd\Desktop\Budget Files\Budget Report\tools"
$hosted = "C:\Users\lansd\Desktop\Budget Files\Budget Report\hosted\index.html"

Write-Host "== Building encrypted dashboard ==" -ForegroundColor Cyan
python "$tools\make_protected.py"
if ($LASTEXITCODE -ne 0) { Write-Host "Encrypt step failed." -ForegroundColor Red; exit 1 }

Copy-Item -LiteralPath $hosted -Destination (Join-Path $PSScriptRoot 'index.html') -Force

Push-Location $PSScriptRoot
try {
    git add -A
    git commit -m "budget dashboard update $(Get-Date -Format 'yyyy-MM-dd HH:mm')" | Out-Null
    git push
    Write-Host ""
    Write-Host "Published. https://kindware.github.io/family-budget/" -ForegroundColor Green
} finally {
    Pop-Location
}
