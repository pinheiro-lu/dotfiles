vim.cmd('source ~/.vimrc')

-- Set undo directory and enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo_nvim"
vim.fn.mkdir(vim.opt.undodir:get()[1], "p")

require("config.lazy")

-- Map Ctrl+L in insert mode to accept Copilot's next word
vim.api.nvim_set_keymap(
  "i",
  "<C-l>",
  "<Plug>(copilot-accept-word)",
  { noremap = false, silent = true }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "latex" },  -- install latex parser
  highlight = { enable = true },
  indent = { enable = true },
}

