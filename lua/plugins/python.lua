return {
  -- 1. Python LSP (Existing)
  -- Provides "Hover" documentation (press 'K' on a symbol)
  -- 1. Python LSP (Refactored to use astrolsp)
  -- Provides "Hover" documentation (press 'K' on a symbol)
  {
    "AstroNvim/astrolsp",
    opts = {
      servers = { "pyright", "ruff" },
    },
  },

  -- 2. Python Debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      -- Use the Mason installed debugpy
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
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

