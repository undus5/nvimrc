# Deprecated

$script_dir = $MyInvocation.MyCommand.Path | Split-Path -Parent
$update_dir = "${$script_dir}\update"
$plugin_dir = "${$script_dir}\plugins"

if ( Test-Path $update_dir ) {
    Remove-Item -Recurse $update_dir
}
New-Item -Path $update_dir -ItemType Directory | Out-Null

Write-Host "downloading and unpacking plugins ..."
foreach($line in Get-Content "${script_dir}\plugins.txt") {
    $line = $line.Trim()
    # $url = "https://github.com/${line}/archive/master.zip"
    $url = "https://ghproxy.com/https://github.com/${line}/archive/master.zip"
    $basename = $line -replace '^.*\/', ''
    $archive_path = "${update_dir}\${basename}-master.zip"
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

Write-Host "updating plugins ... " -NoNewline
Remove-Item -Recurse $plugin_dir
Move-Item $update_dir $plugin_dir
Write-Host "success"
