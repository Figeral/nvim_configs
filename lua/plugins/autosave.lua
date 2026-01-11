return {
  "AstroNvim/astrocore",
  opts = {
    autocmds = {
      autosave = {
        {
          event = { "FocusLost", "BufLeave" },
          desc = "Auto save on focus lost or buffer leave",
          command = "silent! wa",
        },
      },
    },
  },
}


