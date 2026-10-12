$mongoBin = "d:\APP\LibreChat\mongodb\bin\mongod.exe"
$mongoConf = "d:\APP\LibreChat\data\config\mongod.conf"

if (-not (Test-Path $mongoBin)) {
    Write-Error "mongod.exe not found at $mongoBin"
    exit 1
}

Write-Host "Starting isolated MongoDB server on 127.0.0.1:27180..."
& $mongoBin --config $mongoConf
