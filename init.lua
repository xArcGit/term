vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

require('better-comment').Setup({
  tags = {
    {
      name = "TODO",
      fg = "white",
      bg = "#0a7aca",
      bold = true,
      virtual_text = "",
    },
    {
      name = "FIX",
      fg = "white",
      bg = "#f44747",
      bold = true,
      virtual_text = "This is virtual Text from FIX",
    },
    {
      name = "WARNING",
      fg = "#FFA500",
      bg = "",
      bold = false,
      virtual_text = "This is virtual Text from WARNING",
    },
    {
      name = "!",
      fg = "#f44747",
      bg = "",
      bold = true,
      virtual_text = "",
    },
    {
      name = "@",
      fg = "white",
      bg = "#739a95",
      bold = false,
      virtual_text = "Info",
    },

  }
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
