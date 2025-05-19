return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Add the fzf sorter for better performance
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Add file browser extension
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      
      telescope.setup({
        defaults = {
          -- Better prompts with suggestions
          prompt_prefix = "🔍 ",
          selection_caret = "❯ ",
          path_display = { "truncate" },
          
          -- Better mappings for navigation
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close, -- Easy escape
              ["<C-u>"] = false,         -- Clear for line editing
            },
          },
          
          -- Better layout for suggestions
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          
          -- Better sorting for suggestions as you type
          sorting_strategy = "ascending",
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules", ".git/", "target/" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          file_browser = {
            hijack_netrw = true,
            hidden = true,
          },
        },
      })
      
      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      
      -- Better keymaps for file searching
      vim.keymap.set("n", "<space>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
      vim.keymap.set("n", "<space>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
      vim.keymap.set("n", "<space>fg", "<cmd>Telescope live_grep<CR>", { desc = "Find in files" })
      vim.keymap.set("n", "<space>fb", "<cmd>Telescope file_browser<CR>", { desc = "File browser" })
      vim.keymap.set("n", "<space>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
      
      -- Quick close keybinding for ANY sidebar/window
      vim.keymap.set("n", "<space>q", "<cmd>close<CR>", { desc = "Close window/sidebar" })
    end,
  },
}
