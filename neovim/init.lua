--  Core Neovim settings, options, basic autocmds
do
    vim.loader.enable()

    vim.opt.number = true
    vim.opt.relativenumber = true

    vim.o.breakindent = true

    vim.opt.undofile = true

    vim.g.have_nerd_font = false

    vim.opt.splitbelow = true
    vim.opt.splitright = true

    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 0

    vim.o.ignorecase = true
    vim.o.smartcase = true

    vim.o.signcolumn = 'yes'

    vim.o.updatetime = 250

    vim.o.timeoutlen = 300

    vim.o.list = true
    vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

    vim.o.scrolloff = 10

    vim.o.autocomplete = true
end

-- Import configurations like - key mappings, lazy package manager
do
    require('config')
end
