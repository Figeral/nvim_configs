return {
  "jose-elias-alvarez/typescript.nvim",
  ft = { "typescript", "typescriptreact" },
  config = function()
    require("typescript").setup({
      disable_commands = false,
      debug = false,
      go_to_source_definition = {
        fallback = true,
      },
    })
  end,
}
