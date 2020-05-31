$zipFileName = "flying_rocket.zip"
$gameFileName = "flying_rocket.love"

if (Test-Path $zipFileName) {
    Remove-Item $zipFileName
}
Compress-Archive -Path game\* -CompressionLevel Fastest -DestinationPath $zipFileName
if (Test-Path $gameFileName) {
    Remove-Item $gameFileName
}
Rename-Item -Path $zipFileName -NewName $gameFileName -Force
