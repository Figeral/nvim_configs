
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
        "pyright", -- Added for Python LSP (docs, completion)
      },
    },
  },
}
