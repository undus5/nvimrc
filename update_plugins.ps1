$working_dir = Get-Location

7z | Out-Null
if (!$?) {
    Set-Location $working_dir
    Exit
}

$script_dir = $MyInvocation.MyCommand.Path | Split-Path -Parent

Set-Location $script_dir

$target = "plugins"
$backup = "plugins_old"

if ( Test-Path $backup ) {
    Remove-Item -Recurse $target
} else {
    Move-Item $target $backup
}

New-Item -Path $target -ItemType Directory | Out-Null
Set-Location $target

Write-Output "updating ..."
foreach($line in Get-Content $script_dir\$target.txt) {
    $line = $line.Trim()
    $url = "https://github.com/${line}/archive/master.zip"
    $basename = $line -replace '^.*\/', ''
    $filename="${basename}-master.zip"
    curl -sSL $url -o $filename
    if ($?) {
        7z x $filename | Out-Null
        if ($?) {
            Remove-Item $filename
            Move-Item "${basename}-master" $basename
            "{0, -32}`t {1}" -f $line, "updated"
        } else {
            "{0, -32}`t {1}" -f $line, "failed"
            Set-Location $working_dir
            Exit
        }
    } else {
        "{0, -32}`t {1}" -f $line, "failed"
        Set-Location $working_dir
        Exit
    }
}

Remove-Item -Recurse $script_dir\$backup
Set-Location $working_dir
