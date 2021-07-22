# Purpose: Recursively copy all objects within a folder, and paste within another folder

# Source
[string] $SourceDirectoryPath = 'C:\'

# Destination
[string] $TargetDirectoryPath = 'C:\'


New-Item $TargetDirectoryPath -type directory
Get-ChildItem $SourceDirectoryPath -recurse |
    Where-Object { $_.PSIsContainer -eq $False } | ` #Remove the empty folders here
    ForEach-Object {Copy-Item -Path $_.Fullname -Destination $TargetDirectoryPath -Force}


