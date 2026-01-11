return {
  -- 1. Python LSP (Existing)
  -- Provides "Hover" documentation (press 'K' on a symbol)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ruff = {}, -- Add Ruff for linting/formatting
      },
    },
  },

  -- 2. Python Debugger (Existing)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      -- Ensure you have debugpy installed (e.g., via Mason or pip)
      require("dap-python").setup("python") 
    end,
  },



  -- 3. Generate Docstrings (NEW)
  -- Generates Google/Numpy style docstrings automatically
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    -- Uncomment to map a key to generate docstrings:
    -- keys = {
    --   { "<leader>nf", function() require("neogen").generate() end, desc = "Generate Docstring" },
    -- },
  },
}

