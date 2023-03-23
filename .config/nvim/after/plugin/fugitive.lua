vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

vim.keymap.set("n", "<leader>gl", ":0Gclog -n1000<CR>")
vim.keymap.set("n", "<leader>gL", ":0Gclog<CR>")
-- used nicely with gclog, show the vsplitdiff on current diff file
vim.keymap.set("n", "<leader>df", ":Gvdiffsplit<CR>")
-- used nicely with git blame, by placing the cursor to the commit hash in git blame
vim.keymap.set("n", "<leader>dF", ":Gvdiffsplit <C-r><C-w><CR>")
