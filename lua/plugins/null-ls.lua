return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require("null-ls")
    config.sources = {
      -- TypeScript/JavaScript formatting
      null_ls.builtins.formatting.prettier.with({
        extra_filetypes = { "toml", "solidity" },
      }),
      null_ls.builtins.formatting.eslint_d,
      
      -- Diagnostics
      null_ls.builtins.diagnostics.eslint_d,
    }
    return config
  end,
}
