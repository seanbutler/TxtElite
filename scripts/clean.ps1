#
# Removes all downloaded and built files
#

Write-Host "Cleaning Text Elite project..." -ForegroundColor Yellow

if (Test-Path "build") {
    Write-Host "Removing build directory..." -ForegroundColor Cyan
    Remove-Item -Recurse -Force "build"
}

if (Test-Path "download") {
    Write-Host "Removing download directory..." -ForegroundColor Cyan
    Remove-Item -Recurse -Force "download"
}

if (Test-Path "src") {
    Write-Host "Removing src directory..." -ForegroundColor Cyan
    Remove-Item -Recurse -Force "src"
}

Write-Host "Project cleaned successfully!" -ForegroundColor Green
Write-Host "Run 'cmake -B build -G `"Visual Studio 17 2022`"' to re-download and configure." -ForegroundColor Gray
