
# Path to a folder of current date
$Folder = "a_path\$((Get-Date).ToString('yyyy-MM-dd'))"


# Check the existence of a path to a folder of current date
if (Test-Path -Path $Folder) {

    ""
    ""
    "! Folder Already Exists !"
    ""
    ""
    
    Read-Host -Prompt "Press Enter to exit"

} else {

    # Create a new folder with the current date as the name
    New-Item -ItemType Directory -Path "a_path\$((Get-Date).ToString('yyyy-MM-dd'))"

    ""
    ""
    "! Sucessfully Created a New Folder !"
    ""
    ""
    
    Read-Host -Prompt "Press Enter to exit"


}

