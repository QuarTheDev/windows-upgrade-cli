# Requires -RunAsAdministrator
param(
    [Parameter(Position=0, ValueFromPipeline=$false)]
    [System.String]
    $v
)
Clear-Host

# Determine what version

# Greet the user and check for administrator privileges
Write-Host "Windows Upgrader (Automatic)"
Write-Host ""

# Check if option is valid
if ($v -eq "Home") {
    $edition = "Home"
    Write-Host "Windows 11 $edition has been selected."
    $valid = "$True"
    $key = "VFg5WEQtOThON1YtNldNUTYtQlg3RkctSDhROTk="
}
if ($v -eq "Pro") {
    $edition = "Pro"
    Write-Host "Windows 11 $edition has been selected."
    $valid = "$True"
    $key = "VzI2OU4tV0ZHV1gtWVZDOUItNEo2QzktVDgzR1g="
}
if ($v -eq "Education") {
    $edition = "Education"
    Write-Host "Windows 11 $edition has been selected."
    $valid = "$True"
    $key = "Tlc2QzItUU1QVlctRDdLS0stM0dLVDYtVkNGQjI="
}
if ($v -eq "Enterprise") {
    $edition = "Enterprise"
    Write-Host "Windows 11 $edition has been selected."
    $valid = "$True"
    $key = "TlBQUjktRldEQ1gtRDJDOEotSDg3MkstMllUNDM="
}

if ($v -eq "help") {
    Clear-Host
    Write-Host "windows-upgrade-cli  |  Help"
    Write-Host ""
    Write-Host ""
    Write-Host "Proper syntax example:"
    Write-Host '.\upgrader ' -NoNewline -ForegroundColor Yellow
    Write-Host '-v ' -NoNewline -ForegroundColor DarkGray
    Write-Host 'home'
    Write-Host ""
    Write-Host "Effect:"
    Write-Host "Upgrades Windows to a valid version of Home."
    Write-Host ""
    Write-Host "There are 4 possible editions to upgrade to:"
    Write-Host '.\upgrader ' -NoNewline -ForegroundColor Yellow
    Write-Host '-v ' -NoNewline -ForegroundColor DarkGray
    Write-Host 'home'
    Write-Host '.\upgrader ' -NoNewline -ForegroundColor Yellow
    Write-Host '-v ' -NoNewline -ForegroundColor DarkGray
    Write-Host 'pro'
    Write-Host '.\upgrader ' -NoNewline -ForegroundColor Yellow
    Write-Host '-v ' -NoNewline -ForegroundColor DarkGray
    Write-Host 'education'
    Write-Host '.\upgrader ' -NoNewline -ForegroundColor Yellow
    Write-Host '-v ' -NoNewline -ForegroundColor DarkGray
    Write-Host 'enterprise'
    Write-Host ""
    Write-Host " - You " -NoNewline
    Write-Host "CAN " -NoNewline -ForegroundColor Green
    Write-Host "upgrade from Home to Pro, Education, or Enterprise for free."
    Write-Host ""
    Write-Host " - You " -NoNewline
    Write-Host "CAN " -NoNewline -ForegroundColor Green
    Write-Host "register an unregistered version of Home, Pro, Education, or Enterprise for free."
    Write-Host ""
    Write-Host " - You can " -NoNewline
    Write-Host "NOT " -NoNewline -ForegroundColor Red
    Write-Host "downgrade without using System Restore, which means possible data loss."
    Write-Host ""
    Write-Host "How to downgrade using System Restore:"
    Write-Host ""
    Write-Host "Copy and paste the following command into the Terminal:"
    Write-Host 'Restore-Computer ' -NoNewline -ForegroundColor Yellow
    Write-Host '-RestorePoint ' -NoNewline -ForegroundColor DarkGray
    Write-Host '"15" ' -NoNewline -ForegroundColor Blue
    Write-Host '-Confirm ' -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "Please use this tool responsibly and in legal environments only."
    Write-Host ""
    Write-Host "By QuarTheDev (c. 2023)"
    Write-Host ""

    exit 0 #help-display-success
}

if ($v -eq "") {
    Write-Host "You must provide a parameter for execution."
    Write-Host "Run " -NoNewline
    Write-Host '.\upgrader ' -NoNewline -ForegroundColor Yellow
    Write-Host 'help ' -NoNewline
    Write-Host "for more information."
    Write-Host ""
    Write-Host 'Exiting with code 1...'
    
    exit 1 #no-parameter-failure
}

if ($valid -ne $True) {
    Write-Host "The version '$v' is invalid."
    Write-Host "Run " -NoNewline
    Write-Host '.\upgrader ' -NoNewline -ForegroundColor Yellow
    Write-Host 'help ' -NoNewline
    Write-Host "for more information."
    Write-Host ""
    Write-Host 'Exiting with code 2...'
    
    exit 2 #invalid-edition-failure
}

# Print selected edition
Write-Host ""
Write-Host "Upgrading to Windows 11 $edition..."
Write-Host ""

Write-Host "Creating Restore Point..."
Checkpoint-Computer -Description "Windows Key Upgrade Utility" -RestorePointType "MODIFY_SETTINGS" | Out-Null

Write-Host "Disabling Wi-Fi Adapter..."
Set-NetAdapterAdvancedProperty -Name "Wi-Fi" -AllProperties -RegistryKeyword "SoftwareRadioOff" -RegistryValue "1" | Out-Null

Write-Host "Wiping product key..."
slmgr /upk //b

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
Changepk /ProductKey $pkraw | Out-Null

Write-Host "Setting KMS server..."
slmgr /skms kms8.msguides.com //b | Out-Null

Write-Host "Activating license key......"
slmgr /ipk $pkraw //b
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

#      You found me!
# 
#            O
#           /|\
#            |
#           / \
#
# Thanks for supporting me!
#  -@QuarTheDev // GitHub