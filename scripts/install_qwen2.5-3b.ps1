Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$model = "qwen2.5:3b"

Write-Host "== LiveCaptions Translator Model Installer ==" -ForegroundColor Cyan
Write-Host "Checking Ollama..." -ForegroundColor Yellow

if (-not (Get-Command ollama -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Ollama is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Please install Ollama first with OllamaSetup.exe, then run this script again." -ForegroundColor Red
    exit 1
}

Write-Host "Pulling model $model ..." -ForegroundColor Yellow
& ollama pull $model
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to pull model $model." -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "Verifying model list..." -ForegroundColor Yellow
$modelExists = (& ollama list | Select-String -SimpleMatch $model)
if (-not $modelExists) {
    Write-Host "ERROR: Model $model was not found after pull." -ForegroundColor Red
    exit 1
}

Write-Host "Done. Model $model is ready." -ForegroundColor Green
exit 0
