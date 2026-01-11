if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "eslint",
        "tailwindcss",
        "html",
        "cssls",
        "jsonls",
        "ruff", -- Added for Python linting/formatting
      },
    },
  },
}
