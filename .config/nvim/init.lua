vim.cmd('source ~/.vimrc')

-- Set undo directory and enable persistent undo
local undo_dir = vim.fn.stdpath("state") .. "/undo_nvim"
vim.fn.mkdir(undo_dir, "p")
vim.opt.undodir = undo_dir
vim.opt.undofile = true

vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter.git',
		branch = 'master' },
	{ src = 'https://github.com/github/copilot.vim.git' },
	{ src = 'https://github.com/folke/sidekick.nvim.git' },
})

-- Configure sidekick.nvim
require('sidekick').setup()
vim.keymap.set('n', '<leader>ag',
	function() 
		require('sidekick.cli').toggle({ name = "gemini", focus = true })
	end, { desc = 'Sidekick Toggle Gemini' }
)
vim.keymap.set('n', '<leader>af',
	function() require('sidekick.cli').send({ msg = "{file}" }) end,
	{ desc = 'Sidekick Send File' }
)
vim.keymap.set('x', '<leader>av',
	function() require('sidekick.cli').send({ msg = "{selection}" }) end,
	{ desc = 'Sidekick Send Visual Selection' }
)
vim.keymap.set('n', '<Tab>',
	function()
		if not require('sidekick').nes_jump_or_apply() then return "<Tab>" end
	end, { expr = true, noremap = true, desc = 'Sidekick Next Jump or Apply' }
)

-- Map Ctrl+L in insert mode to accept Copilot's next word
vim.api.nvim_set_keymap(
	"i", "<C-l>", "<Plug>(copilot-accept-word)",
	{ noremap = false, silent = true }
)

-- Configure nvim-treesitter for LaTeX
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	once = true,
	callback = function()
		pcall(function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "latex", "markdown", "markdown_inline" },
				highlight = { enable = true }, indent = { enable = true },
			}
			vim.cmd('TSUpdate')
		end)
	end,
})

-- Set colorcolumn to 80 for all filetypes except markdown or typst
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= 'markdown' and vim.bo.filetype ~= 'typst' then
            vim.wo.colorcolumn = '80'
        end
    end,
})
vim.opt.linebreak = true

vim.api.nvim_create_autocmd("CmdlineChanged", {
	pattern = ":",
	callback = function()
		vim.fn.wildtrigger()
	end,
})
vim.opt.wildmode = { "noselect", "lastused", "full" }
--vim.opt.wildoptions = "pum"
