-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  "max397574/better-escape.nvim",

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" }, "typescript")
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function() require("codeium").setup {} end,
  },

  {
    "folke/flash.nvim",
    event = "verylazy",
    ---@type flash.config
    opts = {},
    keys = {
      { "zk", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash" },
      { "zK", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
      { "r", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "treesitter search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "toggle flash search" },
    },
  },

  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    opts = {
      -- Prefer treesitter or LSP as source
      backends = { "lsp", "treesitter", "markdown", "man" },

      layout = {
        max_width = { 40, 0.2 }, -- 40 cols or 20% of screen
        min_width = 40,
        default_direction = "prefer_right",
      },

      show_guides = true, -- indent guides in outline
      highlight_mode = "full_width",
      highlight_on_hover = true,

      -- auto open/close on LSP attach
      attach_mode = "global",
      close_automatic_events = { "unsupported" },
    },
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial outline" },
      { "[[", "<cmd>AerialPrev<CR>", desc = "Prev symbol" },
      { "]]", "<cmd>AerialNext<CR>", desc = "Next symbol" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = true, -- show git blame inline
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          winbar_info = true,
        },
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      file_panel = {
        listing_style = "tree",
        win_config = {
          position = "left",
          width = 35,
        },
      },
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Project History" },
    },
  },
}
