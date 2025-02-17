-- Minimal init file to run Feline with the most basic functionality
-- Run from Feline top-level directory using:
-- nvim --noplugin -u minimal_init.lua

local function load_plugins()
    local packer = require('packer')
    local use = packer.use

    packer.reset()
    packer.init {
        package_root = '/tmp/nvim/site/pack',
        git = {
            clone_timeout = -1
        }
    }

    use 'wbthomason/packer.nvim'
    use {
        'famiu/feline.nvim',
        requires = {
            {
                'lewis6991/gitsigns.nvim',
                requires = { 'nvim-lua/plenary.nvim' },
                config = function()
                    require('gitsigns').setup()
                end
            },
            'kyazdani42/nvim-web-devicons'
        }
    }

    packer.sync()
end

_G.load_config = function()
    vim.opt.termguicolors = true

    -- Replace this part of the config with whatever Feline configuration you're using
    require('feline').setup()
end

local install_path = '/tmp/nvim/site/pack/packer/start/packer.nvim'

vim.opt.packpath = {'/tmp/nvim/site'}

if vim.fn.isdirectory(install_path) == 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

load_plugins()
vim.api.nvim_command('autocmd User PackerComplete ++once lua load_config()')
