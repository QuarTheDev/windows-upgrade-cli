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
    exit 2 #invalid-edition-failure
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
            $key = "VFg5WEQtOThON1YtNldNUTYtQlg3RkctSDhROTk="
        }
        else {
            $key = "M0tIWTctV05UODMtREdRS1ItRjdIUFItODQ0Qk0="
        }
    }
    "Pro" {
        if ($media -eq "Y") {
            $key = "VzI2OU4tV0ZHV1gtWVZDOUItNEo2QzktVDgzR1g="
        }
        else {
            $key = "TUgzN1ctTjQ3WEstVjdYTTktQzcyMjctR0NRRzk="
        }
    }
    "Education" {
        if ($media -eq "Y") {
            $key = "Tlc2QzItUU1QVlctRDdLS0stM0dLVDYtVkNGQjI="
        }
        else {
            $key = "MldINE4tOFFHQlYtSDIySlAtQ1Q0M1EtTURXV0o="
        }
    }
    "Enterprise" {
        if ($media -eq "Y") {
            $key = "TlBQUjktRldEQ1gtRDJDOEotSDg3MkstMllUNDM="
        }
        else {
            $key = "RFBIMlYtVFROVkItNFg5UTMtVEpSNEgtS0hKVzQ="
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
    Checkpoint-Computer -Description "Windows Key Upgrade Utility" -RestorePointType "MODIFY_SETTINGS" | Out-Null

    Write-Host "Disabling Wi-Fi Adapter..."
    Set-NetAdapterAdvancedProperty -Name "Wi-Fi" -AllProperties -RegistryKeyword "SoftwareRadioOff" -RegistryValue "1" | Out-Null

    Write-Host "Wiping product key..."
    slmgr /upk //b
    Start-Sleep -Milliseconds 500

    Write-Host "Wiping product key from Registry..."
    slmgr /cpky //b

    Write-Host "Wiping KMS server data..."
    slmgr /ckms //b

    # Write-Host "Assigning automatic license on boot..."
    # Set-Content config LicenseManager start= auto | Out-Null

    # Write-Host "Launching LicenseManager service..."
    # net start LicenseManager | Out-Null

    # Write-Host "Assigning automatic update on boot..."
    # Set-Content config wuauserv start= auto | Out-Null

    # Write-Host "Launching update service..."
    # net start wuauser | Out-Null

    Write-Host "Registering license key..."
    $pkraw = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("$key"))
    Changepk /ProductKey "$pkraw" | Out-Null

    Write-Host "Setting KMS server..."
    slmgr /skms kms8.msguides.com //b | Out-Null

    Write-Host "Activating license key......"
    slmgr /ipk "$pkraw" //b
    slmgr /ato //b

    Write-Host "Enabling Wi-Fi Adapter..."
    Set-NetAdapterAdvancedProperty -Name "Wi-Fi" -AllProperties -RegistryKeyword "SoftwareRadioOff" -RegistryValue "0" | Out-Null
    Write-Host ""

    Write-Host "Complete! You have registered Windows 11 $edition."
    Write-Host ""
    changepk
    Write-Host "A Settings menu has opened. It should say Active under Activation State."
    Write-Host "If it does not, run " -NoNewline
    Write-Host "Restart-Computer " -NoNewline -ForegroundColor Yellow
    Write-Host "(triggers a restart)"
    exit 0 #main-branch-success
}
else {
    Write-Host ""
    Write-Host "Upgrade cancelled."
    exit 127 #end-user-exit
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