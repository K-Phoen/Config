local map = vim.keymap.set

-- Clear search on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Clear hlsearch" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move lines up and down using "Alt" + "j" / "k" in normal and visual
-- modes, and "Ctrl + Up/Down" in insert mode.
map("n", "<m-j>", "<cmd>m .+1<cr>==")
map("n", "<m-k>", "<cmd>m .-2<cr>==")
map("i", "<C-Down>", "<esc><cmd>m .+1<cr>==gi")
map("i", "<C-Up>", "<esc><cmd>m .-2<cr>==gi")
map("v", "<m-j>", ":m '>+1<cr>gv=gv")
map("v", "<m-k>", ":m '<-2<cr>gv=gv")

-- Toggle options
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
Snacks.toggle.dim():map("<leader>uD")
