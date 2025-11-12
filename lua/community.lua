---@type LazySpec
local specs = {
  "AstroNvim/astrocommunity",
}

-- 🔧 Short helper functions
local function import_pack(name) table.insert(specs, { import = "astrocommunity.pack." .. name }) end

local function import_recipe(name) table.insert(specs, { import = "astrocommunity.recipes." .. name }) end

local function import_motion(name) table.insert(specs, { import = "astrocommunity.motion." .. name }) end

local function import_lsp(name) table.insert(specs, { import = "astrocommunity.lsp." .. name }) end

local function import_colorscheme(name) table.insert(specs, { import = "astrocommunity.colorscheme." .. name }) end

local function import_keybinding(name) table.insert(specs, { import = "astrocommunity.keybinding." .. name }) end

local function import_snippet(name) table.insert(specs, { import = "astrocommunity.snippet." .. name }) end

local function import_completion(name) table.insert(specs, { import = "astrocommunity.completion." .. name }) end
-- 📦 Use them here
import_pack "lua"
import_pack "astro"
import_pack "biome"
import_pack "html-css"
import_pack "oxlint"
import_pack "svelte"
import_pack "tailwindcss"
import_pack "typescript-all-in-one"
import_pack "vue"
import_pack "markdown"

import_colorscheme "catppuccin"
import_colorscheme "tokyonight-nvim"

import_recipe "astrolsp-no-insert-inlay-hints"
import_recipe "diagnostic-virtual-lines-current-line"
import_recipe "heirline-vscode-winbar"

import_keybinding "mini-clue"

import_lsp "lsp-signature-nvim"
import_lsp "lspsaga-nvim"

import_motion "mini-move"
import_motion "mini-basics"
import_motion "mini-jump"
import_motion "mini-bracketed"
import_motion "nvim-surround"

import_snippet "nvim-snippets"

import_completion "blink-cmp-emoji"
import_completion "blink-cmp"

return specs
