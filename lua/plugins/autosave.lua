return {
  polish = function()
    vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
      pattern = "*",
      command = "silent! wa"
    })
  end
}


