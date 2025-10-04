--- @type LazySpec
return {
  {
    "saghen/blink.compat",
    version = "2.*",
    lazy = true,
    opts = {
      compat = true,
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "moyiz/blink-emoji.nvim",
      "jdrupal-dev/css-vars.nvim",
      "Exafunction/codeium.nvim",
    },
    version = "1.*",
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "super-tab" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        list = { selection = { preselect = true, auto_insert = true } },
        menu = {
          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
            },
            components = {
              label = {
                text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
                highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
              },
              kind_icon = {
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
              kind = {
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
          auto_show = true,
        },
        keyword = {
          range = "full",
        },
        ghost_text = {
          enabled = false,
          show_with_selection = true,
          show_without_selection = false,
          show_with_menu = true,
          show_without_menu = true,
        },
        trigger = {
          auto = true,
          delay = 100,
          completion = {
            enabled = true,
            trigger_characters = { ".", ":", "->", ":", "@" },
          },
          show_on_keyword = true,
        },
        documentation = {
          auto_show = true,
          auto_show_delay = 500,
        },
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "codeium",
          "emoji",
          "css_vars",
        },
        providers = {
          codeium = {
            name = "Codeium",
            module = "codeium.blink",
            async = true,
            score_offset = 100,
          },
          emoji = {
            name = "Emoji",
            module = "blink-emoji",
            score_offset = 50,
            async = true,
          },
          css_vars = {
            name = "css-vars",
            module = "css-vars.blink",
            score_offset = 50,
            async = true,
          },
          path = {
            opts = {
              trailing_slash = false,
              show_hidden_files_by_default = true,
              get_cwd = function(_) return vim.fn.getcwd() end,
            },
          },
        },
      },
      signature = { enabled = false },
    },
  },
}
