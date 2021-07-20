
# Path to a folder of current date
$Folder = "a_path\$((Get-Date).ToString('yyyy-MM-dd'))"


# Check the existence of a path to a folder of current date
if (Test-Path -Path $Folder) {

    ""
    ""
    "! Folder Already Exists !"
    ""
    ""
    
    Start-Sleep -Seconds 2 -Milliseconds 300

} else {

    # Create a new folder with the current date as the name
    New-Item -ItemType Directory -Path "a_path\$((Get-Date).ToString('yyyy-MM-dd'))"

    ""
    ""
    "! Sucessfully Created a New Folder !"
    ""
    ""

    Start-Sleep -Seconds 2 -Milliseconds 300


}

