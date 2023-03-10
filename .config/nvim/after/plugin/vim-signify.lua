vim.keymap.set("n", "<leader>gd", ":SignifyDiff<CR>", {})
vim.keymap.set("n", "<leader>gh", ":SignifyHunkDiff<CR>", {})
vim.keymap.set("n", "<leader>gu", ":SignifyHunkUndo<CR>", {})
vim.keymap.set("n", "]h", "<plug>(signify-next-hunk)", {})
vim.keymap.set("n", "[h", "<plug>(signify-prev-hunk)", {})


