# test 7z
7z | Out-Null
if (!$?) {
    Exit
}

$script_dir = $MyInvocation.MyCommand.Path | Split-Path -Parent

Set-Location $script_dir

$backup = "plugins_old"

if ( Test-Path $backup ) {
    Write-Output "error: ${backup} exists, restore it first"
    Exit
}

$target = "plugins"

Move-Item $target $backup
New-Item -Path $target -ItemType Directory

Set-Location $target

Write-Output "downloading and unpacking:"
foreach($line in Get-Content $script_dir\$target.txt) {
    $line = $line.Trim()
    $url = "https://github.com/${line}/archive/master.zip"
    $basename = $line -replace '^.*\/', ''
    $filename="${basename}-master.zip"
    curl -sSL "$url" -o "$filename"
    if ($?) {
        7z x $filename | Out-Null
        if ($?) {
            Remove-Item $filename
            Move-Item "${basename}-master" $basename
            "{0, -32}`t... {1}" -f $filename, "done"
        } else {
            "{0, -32}`t... {1}" -f $filename, "failed"
            Exit
        }
    } else {
        "{0, -32}`t... {1}" -f $filename, "failed"
        Exit
    }
}

Remove-Item -Recurse $script_dir\$backup