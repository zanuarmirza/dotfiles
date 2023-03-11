vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>wr", vim.cmd.w)

vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")

-- copy then search
vim.keymap.set('n', '<leader>/', '/<C-R><C-W><CR>Nzz', { noremap = true })
-- replace from select result
vim.keymap.set('n', '<leader>r', 'cgn')

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "j", "jzz", { noremap = true })
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- prevent replacing current register with deleted one
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy line to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete black hole register
vim.keymap.set({ "n", "v" }, "x", [["_x]]) -- single delete black hole register
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader><C-f>", vim.cmd.Neoformat) -- used for prettier format like

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace all
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
-- tabs
vim.keymap.set('n', 'tn', '<cmd>tabnew<cr>')
vim.keymap.set('n', 'tq', '<cmd>tabclose<cr>')

-- resize window
vim.keymap.set('n', '<C-w><C-left>', '<C-w>10<')
vim.keymap.set('n', '<C-w><C-right>', '<C-w>10>')
vim.keymap.set('n', '<C-w><C-up>', '<C-w>10+')
vim.keymap.set('n', '<C-w><C-down>', '<C-w>10-')


-- buffer switch
vim.keymap.set("n", "<leader>bn", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- quickfix
vim.keymap.set("n", "cq", "<cmd>cclose<CR>zz", {})
vim.keymap.set("n", "cn", "<cmd>copen<CR>zz", {})
vim.keymap.set("n", "cn", "<cmd>cnext<CR>zz", {})
vim.keymap.set("n", "cp", "<cmd>cprev<CR>zz", {})
