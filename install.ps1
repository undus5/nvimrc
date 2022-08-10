$runtime_path = "~\.vim_runtime"
$vimrc_source = "${runtime_path}\vimrc"
$vimrc_destination = "~\_vimrc"
$gvimrc_destination = "~\_gvimrc"

Copy-Item $vimrc_source -Destination $vimrc_destination
if ( !(Test-Path $gvimrc_destination) ) {
    New-Item -ItemType file $gvimrc_destination
}

# $nvim_config_dir = "~\AppData\Local\nvim"
#
# if ( !(Test-Path $nvim_config_dir) ) {
#     New-Item -Path $nvim_config_dir -ItemType Directory | Out-Null
# }
#
# $nvimrc_destination = "${nvim_config_dir}\init.vim"
# $gnvimrc_source = "${runtime_path}\ginit.vim"
# $gnvimrc_destination = "${nvim_config_dir}\ginit.vim"
#
# Copy-Item $vimrc_source -Destination $nvimrc_destination
# Copy-Item $gnvimrc_source -Destination $gnvimrc_destination
