$ErrorActionPreference = "Stop"

# 1. Ensure isolated MongoDB is running on port 27180
$mongoPort = 27180
$mongoConn = Get-NetTCPConnection -LocalPort $mongoPort -ErrorAction SilentlyContinue
if (-not $mongoConn) {
    Write-Host "Starting isolated MongoDB server on port $mongoPort..."
    $mongoBin = "d:\APP\LibreChat\mongodb\bin\mongod.exe"
    $mongoConf = "d:\APP\LibreChat\data\config\mongod.conf"
    Start-Process -FilePath $mongoBin -ArgumentList "--config `"$mongoConf`"" -WindowStyle Hidden
    Start-Sleep -Seconds 2
} else {
    Write-Host "MongoDB is already running on port $mongoPort."
}

# 2. Start LibreChat application
Write-Host "Starting LibreChat application on http://localhost:3180..."
$env:NODE_ENV = "production"
& node "d:\APP\LibreChat\api\server\index.js"
