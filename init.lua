--

local script_path = debug.getinfo(1, "S").source:match("^@(.+)$")
local script_dir = script_path:match("^(.*[\\/])")

vim.cmd('source ' .. script_dir .. '/vimrc')

vim.fn['pathogen#infect']('plugins/{}')

require("oil").setup()

