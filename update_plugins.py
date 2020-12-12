try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import zipfile
import shutil
import tempfile
import requests

from os import path

# --- Globals ----------------------------------------------
PLUGINS = """
auto-pairs https://github.com/jiangmiao/auto-pairs
ale https://github.com/w0rp/ale
ack.vim https://github.com/mileszs/ack.vim
bufexplorer https://github.com/jlanzarotta/bufexplorer
ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim
nerdtree https://github.com/scrooloose/nerdtree
nginx.vim https://github.com/chr4/nginx.vim
open_file_under_cursor.vim https://github.com/amix/open_file_under_cursor.vim
tlib https://github.com/vim-scripts/tlib
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-snipmate https://github.com/garbas/vim-snipmate
vim-snippets https://github.com/honza/vim-snippets
vim-surround https://github.com/tpope/vim-surround
vim-expand-region https://github.com/terryma/vim-expand-region
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-fugitive https://github.com/tpope/vim-fugitive
vim-commentary https://github.com/tpope/vim-commentary
vim-gitgutter https://github.com/airblade/vim-gitgutter
lightline.vim https://github.com/itchyny/lightline.vim
lightline-ale https://github.com/maximbaz/lightline-ale
vim-markdown https://github.com/plasticboy/vim-markdown
vim-gist https://github.com/mattn/vim-gist
vim-ruby https://github.com/vim-ruby/vim-ruby
vim-javascript https://github.com/pangloss/vim-javascript
emmet-vim https://github.com/mattn/emmet-vim
rename.vim https://github.com/danro/rename.vim
vim-endwise https://github.com/tpope/vim-endwise
matchit https://github.com/tmhedberg/matchit.git
vim-vue https://github.com/posva/vim-vue
wxapp.vim https://github.com/chemzqm/wxapp.vim
""".strip()

GITHUB_ZIP = "%s/archive/master.zip"

SOURCE_DIR = path.join(path.dirname(__file__), "plugins")


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, "wb").write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(
        temp_dir, path.join(temp_dir, "%s-master" % plugin_name)
    )

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print("Updated {0}".format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(" ")
    zip_path = GITHUB_ZIP % github_url
    download_extract_replace(name, zip_path, temp_directory, SOURCE_DIR)


if __name__ == "__main__":
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(update, PLUGINS.splitlines())
        else:
            [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
