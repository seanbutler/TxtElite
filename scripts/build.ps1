#
# Build script
#

Write-Host "Building Text Elite project..." -ForegroundColor Yellow

#
# Configure the project
#

Write-Host "Configuring CMake..." -ForegroundColor Cyan
cmake -B build -G "Visual Studio 17 2022"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Configuration failed!" -ForegroundColor Red
    exit $LASTEXITCODE
}

#
# Build the project
#

Write-Host "Building Release configuration..." -ForegroundColor Cyan
cmake --build build --config Release

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed!" -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "Build completed successfully!" -ForegroundColor Green

