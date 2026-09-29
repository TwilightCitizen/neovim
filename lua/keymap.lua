do
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
	
	--vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
	
	vim.keymap.set("n", "<left>", "<cmd>echo \"Use h to move left\"<CR>")
	vim.keymap.set("n", "<right>", "<cmd>echo \"Use l to move right\"<CR>")
	vim.keymap.set("n", "<up>", "<cmd>echo \"Use k to move up\"<CR>")
	vim.keymap.set("n", "<down>", "<cmd>echo \"Use j to move down\"<CR>")
	vim.keymap.set("n", "<Del>", "<cmd>echo \"Use x to delete\"<CR>")
	vim.keymap.set("n", "<BS>", "<cmd>echo \"Use X to backspace\"<CR>")
	
	--[[
		vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
		vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
		vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
		vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
		vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
		vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
		vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
		vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
	--]]
	
	vim.keymap.set("n", "<leader>n", function() 
		vim.wo.relativenumber = not vim.wo.relativenumber
	end, { desc = "Toggle relative line numbers"})
end
