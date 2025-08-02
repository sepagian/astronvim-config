--- @type LazySpec
return {
  {
    "saghen/blink.compat",
    version = "2.*",
    lazy = true,
    opts = {
      -- This is a compatibility layer for Blink CMP v2
      -- It allows using the new Blink CMP v3 features while maintaining compatibility with v2
      -- It is recommended to use the latest version of Blink CMP for new projects
      -- but this compatibility layer can be useful for existing projects that need to be updated gradually
      compat = true,
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "giuxtaposition/blink-cmp-copilot",
      "moyiz/blink-emoji.nvim",
      "jdrupal-dev/css-vars.nvim",
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
            },
          },
          auto_show = false,
        },
        ghost_text = {
          enabled = true,
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
          "copilot",
          "emoji",
          "css_vars",
        },
        providers = {
          copilot = {
            name = "Copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
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
          path = { opts = { trailing_slash = false, show_hidden_files_by_default = true } },
        },
      },
      signature = { enabled = true },
    },
  },
}
