$script_dir = $MyInvocation.MyCommand.Path | Split-Path -Parent
$update_dir = "${$script_dir}\update"

if ( Test-Path $update_dir ) {
    Remove-Item -Recurse $update_dir
}

New-Item -Path $update_dir -ItemType Directory | Out-Null

Write-Output "downloading and unpacking plugins ..."
foreach($line in Get-Content "$script_dir\plugins.txt") {
    $line = $line.Trim()
    $url = "https://github.com/${line}/archive/master.zip"
    $basename = $line -replace '^.*\/', ''
    $archive_path="${basename}-master.zip"
    curl -sSL $url -o $archive_path
    if ($?) {
        Expand-Archive -Path $archive_path -DestinationPath $update_dir
        if ($?) {
            Remove-Item $archive_path
            Move-Item "${update_dir}\${basename}-master" ${update_dir}\${basename}
            "{0, -32}`t {1}" -f $line, "success"
        } else {
            "{0, -32}`t {1}" -f $line, "error"
            Exit
        }
    } else {
        "{0, -32}`t {1}" -f $line, "error"
        Exit
    }
}

Write-Output "updating plugins ..."
Move-Item $update_dir "${script_dir}\plugins"
Write-Output "success"
