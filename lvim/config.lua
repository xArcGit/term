lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py", "*.go", "*.mod", "*.ts", "*.json", "*.js", "*.md" }
lvim.plugins = {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require('gitsigns').setup { current_line_blame = true }
    end
  },
  {
    "sitiom/nvim-numbertoggle",
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "Djancyp/better-comments.nvim",
    config = function()
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
          }

        }
      })
    end
  },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require("nvim-highlight-colors").setup {
        render = 'virtual',
        virtual_symbol = '■',
        virtual_symbol_prefix = '',
        virtual_symbol_suffix = ' ',
        virtual_symbol_position = 'inline',
        enable_hex = true,
        enable_rgb = true,
        enable_hsl = true,
        enable_var_usage = true,
        enable_named_colors = true,
        enable_tailwind = false,
        custom_colors = {
          { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
          { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
        }
      }
    end
  }
}
