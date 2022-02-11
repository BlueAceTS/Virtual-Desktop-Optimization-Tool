$outputPath = "C:\temp"
$baseURI = "https://raw.githubusercontent.com/BlueAceTS/Virtual-Desktop-Optimization-Tool/main/"

$fileList = @('AppxPackages.json','Autologgers.Json','DefaultUserSettings.json','LanManWorkstation.json','PolicyRegSettings.json','ScheduledTasks.json','Services.json')

if ((Test-Path $outputPath) -ne $true) { New-Item -ItemType Directory -Path $outputPath }
Invoke-WebRequest "$baseURI/Windows_VDOT.ps1" -OutFile "$outputPath\Windows_VDOT.ps1"
$startFile = "$outputPath\Windows_VDOT.ps1"

$outputPath = "$outputPath\2009\ConfigurationFiles"
$baseURI = "https://raw.githubusercontent.com/BlueAceTS/Virtual-Desktop-Optimization-Tool/main/2009/ConfigurationFiles"

if ((Test-Path $outputPath) -ne $true) { New-Item -ItemType Directory -Path $outputPath -Force }

foreach ($file in $fileList) {
    Invoke-WebRequest "$baseURI/$file" -OutFile "$outputPath\$file"
}

$startFile -AcceptEULA
