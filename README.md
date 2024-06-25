```powershell
$env:PATH = "$env:Path;d:\dev\packer;D:\Tools\packer"
$env:PACKER_PLUGIN_PATH = "./packer"


# https://developer.hashicorp.com/packer/integrations/hashicorp/hyperv
packer init .
packer build -var-file="variables.pkvars.hcl" .




# https://github.com/SvenGroot/GenerateAnswerFile/tree/main
./GenerateAnswerFile unattend.xml `
    -Install CleanEfi `
    -DisableCloud `
    -DisableServerManager `
    -EnableRemoteDesktop `
    -Language en-GB `
    -TimeZone "GMT Standard Time" `
    -ProductKey WX4NM-KYWYW-QJJR4-XV3QB-6VM33

# https://blog.idera.com/database-tools/powershell/powertips/creating-iso-files/
. .\New-IsoFile.ps1
New-IsoFile -NewIsoFilePath files/secondary.iso -ImageName ExtraFiles -SourceFilePath '.\files\iso_files'


$servername = "server_test"
$path = New-Item -Type Directory -Path (Join-Path "F:\Virtual Machines" $server_test)
Copy-Item -Path output-windows_2022_dc_dc/windows_2022_dc_dc.vhdx -Destination $path
New-VM -Name $servername -MemoryStartupBytes 4GB -VHDPath (Join-Path $path "windows_2022_dc_de.vhdx")

```