require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- lua/custom/mappings.lua
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>tt", function()
  local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
  if bg == nil then
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1a1a" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1a1a" })
  else
    require("base46").toggle_transparency()
  end
end, { noremap = true, silent = true, desc = "Toggle partial transparency" })
-- ========================
-- LSP Hover (Shift-K)
-- ========================
vim.api.nvim_set_keymap(
  "n",
  "K",
  "<cmd>lua vim.lsp.buf.hover()<CR>",
  opts
)

-- ========================
-- System man page (Ctrl-K)
-- ========================
vim.api.nvim_set_keymap(
  "n",
  "<C-K>",
  "<cmd>Man<CR>",
  opts
)

-- ========================
-- LSP Code Action (fix available)
-- ========================
vim.keymap.set(
  "n",
  "<leader>ca",
  function() vim.lsp.buf.code_action() end,
  { noremap = true, silent = true, desc = "LSP Code Action" }
)
