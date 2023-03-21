# Requires -RunAsAdministrator
Clear-Host

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
        $media = Read-Host "Do you want Media Player functionality? (Y/N)"
    }
    2 {
        $edition = "Pro"
        Write-Host ""
        $media = Read-Host "Do you want Media Player functionality? (Y/N)"
    }
    3 {
        $edition = "Education"
        Write-Host ""
        $media = Read-Host "Do you want Media Player functionality? (Y/N)"
    }
    4 {
        $edition = "Enterprise"
        Write-Host ""
        $media = Read-Host "Do you want Media Player functionality? (Y/N)"
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
    Checkpoint-Computer -Description "Windows Key Upgrade Utility" -RestorePointType "MODIFY_SETTINGS" 2>$null
    Write-Host "Disabling Wi-Fi Adapter..."
    powershell Set-NetAdapterAdvancedProperty -Name "Wi-Fi" -AllProperties -RegistryKeyword "SoftwareRadioOff" -RegistryValue "1"
    Write-Host "Wiping product key..."
    slmgr /upk 2>$null
    Write-Host "Wiping product key from Registry..."
    slmgr /cpky 2>$null
    Write-Host "Wiping KMS server data..."
    slmgr /ckms 2>$null
    # Write-Host "Assigning automatic license on boot..."
    # Set-Content config LicenseManager start= auto 2>$null
    Write-Host "Launching LicenseManager service..."
    net start LicenseManager 2>$null
    # Write-Host "Assigning automatic update on boot..."
    # Set-Content config wuauserv start= auto 2>$null
    Write-Host "Launching update service..."
    net start wuauser 2>$null
    # Write-Host "Registering license key..."
    # Changepk /ProductKey $key 2>$null
    Write-Host "Setting KMS server..."
    slmgr /skms kms8.msguides.com 2>$null
    Write-Host "Activating license key......"
    slmgr /ipk $key 2>$null
    slmgr /ato 2>$null
    Write-Host "Enabling Wi-Fi Adapter..."
    Get-Process wscript | ForEach-Object { $_.CloseMainWindow() } | Out-Null
    powershell Set-NetAdapterAdvancedProperty -Name "Wi-Fi" -AllProperties -RegistryKeyword "SoftwareRadioOff" -RegistryValue "0"
    Write-Host ""
    Get-Process wscript | ForEach-Object { $_.CloseMainWindow() } | Out-Null
    Write-Host "Complete! You have registered Windows 11 $edition."
    Write-Host ""
    Write-Host "Restart to apply these changes."
    exit
}
else {
    Write-Host ""
    Write-Host "Upgrade cancelled."
    exit
}

#      You found me!
# 
#            O
#           /|\
#            |
#           / \
#
# Thanks for supporting me!
#  -@QuarTheDev // GitHub
