# Requires -RunAsAdministrator
cls

# Greet the user and check for administrator privileges
Write-Host "Windows Upgrader"
Write-Host ""

# Ask the preferred upgrade version
Write-Host "Which version of Windows would you like to upgrade to?"
Write-Host ""
Write-Host "[1] Home"
Write-Host "[2] Pro"
Write-Host "[3] Education"
Write-Host "[4] Enterprise"
Write-Host ""

[int]$option = Read-Host "Select an option (1-4)"

# Check if option is valid
if ($option -lt 1 -or $option -gt 4) {
    Write-Host "Invalid option; exiting."
    Exit
}

# Determine edition and media player
$edition = ""
$media = ""
switch ($option) {
    1 {
        $edition = "Home"
        Write-Host ""
        Write-Host "Do you want Media Player functionality? (Y/N)"
        $media = Read-Host
    }
    2 {
        $edition = "Pro"
        Write-Host ""
        Write-Host "Do you want Media Player functionality? (Y/N)"
        $media = Read-Host
    }
    3 {
        $edition = "Education"
        Write-Host ""
        Write-Host "Do you want Media Player functionality? (Y/N)"
        $media = Read-Host
    }
    4 {
        $edition = "Enterprise"
        Write-Host ""
        Write-Host "Do you want Media Player functionality? (Y/N)"
        $media = Read-Host
    }
}

# Determine product key based on edition and media player
$key = ""
switch ($edition) {
    "Home" {
        if ($media -eq "Y") {
            $key = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
        }
        else {
            $key = "3KHY7-WNT83-DGQKR-F7HPR-844BM"
        }
    }
    "Pro" {
        if ($media -eq "Y") {
            $key = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
        }
        else {
            $key = "MH37W-N47XK-V7XM9-C7227-GCQG9"
        }
    }
    "Education" {
        if ($media -eq "Y") {
            $key = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
        }
        else {
            $key = "2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
        }
    }
    "Enterprise" {
        if ($media -eq "Y") {
            $key = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
        }
        else {
            $key = "DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
        }
    }
}

# Print selected edition and ask for upgrade confirmation
Write-Host ""
Write-Host "You will now upgrade to Windows 11 $edition."
$upgrade = Read-Host "Are you sure you wish to upgrade? (Y/N)"

if ($upgrade -eq "Y") {
    Write-Host ""
    Write-Host "Creating Restore Point..."
    Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS" 2>&1 | out-null
    Write-Host "Done"
    Write-Host ""
    Write-Host "Wiping product key..."
    slmgr /upk 2>&1 | out-null
    Write-Host ""
    Write-Host "Wiping product key from Registry..."
    slmgr /cpky 2>&1 | out-null
    Write-Host ""
    Write-Host "Wiping KMS server data..."
    slmgr /ckms 2>&1 | out-null
    Write-Host ""
    Write-Host "Assigning automatic license on boot..."
    sc config LicenseManager start= auto 2>&1 | out-null
    Write-Host ""
    Write-Host "Launching LicenseManager service..."
    net start LicenseManager 2>&1 | out-null
    Write-Host ""
    Write-Host "Assigning automatic update on boot..."
    sc config wuauserv start= auto 2>&1 | out-null
    Write-Host ""
    Write-Host "Launching update service..."
    net start wuauser 2>&1 | out-null
    Write-Host ""
    Write-Host "Registering license key..."
    changepk.exe /productkey $key 2>&1 | out-null
    Write-Host ""
    Write-Host "Setting KMS server..."
    slmgr /skms kms8.msguides.com 2>&1 | out-null
    Write-Host ""
    Write-Host "Activating license key......"
    slmgr /ipk $key 2>&1 | out-null
    slmgr /ato 2>&1 | out-null
    Write-Host ""
    Write-Host "Complete! You have registered %name%."
    Write-Host ""
    Write-Host "Restart to apply these changes."
    exit
}
else {
    Write-Host ""
    Write-Host "Upgrade cancelled."
}
