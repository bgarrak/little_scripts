
[string] $SourceDirectoryPath = 'C:\'
[string] $TargetDirectoryPath = 'C:\'


[System.Collections.ArrayList] $filesToMove = Get-ChildItem -Path $SourceDirectoryPath

$filesToMove | ForEach-Object {

    [System.IO.FileInfo] $file = $_


    ###############################################################################################################################


    [DateTime] $fileDate = $file.LastWriteTime
    [string] $dateDirectoryName = $fileDate.ToString('yyyy-MM-dd') # Assign the current date to directory name 
    [string] $dateDirectoryPath = Join-Path -Path $TargetDirectoryPath -ChildPath $dateDirectoryName # Join directory name and path together


    # The month and year as a future folder name
    [string] $dateDirectoryMonth = $fileDate.ToString('MMM-yyyy')

    # Make the path for months that are not this month
    [string] $monthFolderPath = Join-Path -Path $TargetDirectoryPath -ChildPath $dateDirectoryMonth


    # The file's last edited date as a month
    [string] $fileWriteMonth = $fileDate.ToString('MMM')

    # Abbreviated month name       (Get-Culture).DateTimeFormat.GetMonthName((Get-Date).Month)
    [string] $currentMonth = (Get-Culture).DateTimeFormat.GetAbbreviatedMonthName((Get-Date).Month)

    
    [string] $dayInMonthFolderPath = Join-Path -Path $monthFolderPath -ChildPath $dateDirectoryName
    

    ##############################################################################################################################

    # ""
    # ""

    # "dateDirectoryMonth:'$dateDirectoryMonth' "

    # "monthFolderPath: '$monthFolderPath' "

    # "fileWriteMonth: '$fileWriteMonth' "

    # "fileWriteMonth: '$fileWriteMonth' "

    # "currentMonth: '$currentMonth' "

    # "dayInMonthFolderPath: '$dayInMonthFolderPath' "

    # ""
    # ""

    ##############################################################################################################################

    if (!(Test-Path -Path $monthFolderPath -PathType Container) -and ($fileWriteMonth -ne $currentMonth)) # Check for prior existence of folder
    {

        Write-Verbose "Creating directory '$dateDirectoryMonth' in '$monthFolderPath'."
        New-Item -ItemType Directory -Path $monthFolderPath


        ""
        ""
        "!Month Folder Created!"
        ""
        ""

        #[string] $dayInMonthFolderPath = Join-Path -Path $monthFolderPath -ChildPath $dateDirectoryName


        [string] $filePath = $file.FullName
            
        Write-Information "Moving file '$filePath' into directory '$dayInMonthFolderPath'."
        Move-Item -Path $filePath -Destination $dayInMonthFolderPath


    } elseif ((Test-Path -Path $monthFolderPath -PathType Container) -and !(Test-Path -Path $dayInMonthFolderPath -PathType Container) -and ($fileWriteMonth -ne $currentMonth)) { 


        ""
        ""
        "!MONTH FOLDER ALREADY PRESENT!"
        "!DATE FOLDER NOT PRESENT!"
        ""
        ""

        # Make the path for months and days that are not this month
        #[string] $monthAndDayFolderPath = Join-Path -Path $monthFolderPath -ChildPath $dateDirectoryMonth

        ""
        ""
        "!CREATING DATE FOLDER IN NON-CURRENT MONTH !"
        ""
        ""

        Write-Verbose "Creating directory '$dayInMonthFolderPath'."
        New-Item -ItemType Directory -Path $dayInMonthFolderPath


        # [string] $filePath = $file.FullName
            
        # Write-Information "Moving file '$filePath' into directory '$dayInMonthFolderPath'."
        # Move-Item -Path $filePath -Destination $dayInMonthFolderPath



    } elseif ((Test-Path -Path $monthFolderPath -PathType Container) -and (Test-Path -Path $dayInMonthFolderPath -PathType Container) -and ($fileWriteMonth -ne $currentMonth)) { 


        ""
        ""
        "!MONTH AND DATE FOLDER ALREADY PRESENT!"
        ""
        ""

        [string] $filePath = $file.FullName
            
        Write-Information "Moving file '$filePath' into directory '$dayInMonthFolderPath'."
        Move-Item -Path $filePath -Destination $dayInMonthFolderPath



    } elseif (!(Test-Path -Path $dateDirectoryPath -PathType Container) -and ($fileWriteMonth -eq $currentMonth)) { # Check for prior existence of folder and that it is a current month


        ""
        ""
        "!IN CURRENT MONTH!"
        ""
        ""


        Write-Verbose "Creating directory '$dateDirectoryPath'."
        New-Item -ItemType Directory -Path $dateDirectoryPath


        [string] $filePath = $file.FullName
            
        Write-Information "Moving file '$filePath' into directory '$dateDirectoryPath'."
        Move-Item -Path $filePath -Destination $dateDirectoryPath

    } elseif ((Test-Path -Path $dateDirectoryPath -PathType Container) -and (Test-Path -Path $dayInMonthFolderPath -PathType Container) -and ($fileWriteMonth -eq $currentMonth)) {

        ""
        ""
        $temp_text = "A date Folder for the current month was already created with date: "
        $temp_text+$dateDirectoryName 
        ""
        "!!!BUT THIS FILE HAS NOT BEEN COPIED YET!!!"
        ""

        [string] $filePath = $file.FullName
        Write-Information "Moving file '$filePath' into directory '$dateDirectoryPath'."
        Move-Item -Path $filePath -Destination $dateDirectoryPath

    } else {

        ""
        ""
        "FILE MAY BE COPIED ALREADY"
        ""
        ""


    }



}


