# Path that child items will be returned to from objects within this path
$path = ""


Get-ChildItem -Path $path -Recurse | # Can filter objects by file type  ex: *.png |

Foreach-Object { 

    Move-Item -Path (Join-Path -Path $_.FullName -ChildPath '\*.png') -Destination $path

}
