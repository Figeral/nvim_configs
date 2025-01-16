return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Keybindings for LSP features
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        -- Hover documentation
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- Go to definition
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- Go to references
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- Code actions
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        -- Rename symbol
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        -- Show diagnostics on hover
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        -- Go to next/previous diagnostic
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      end

      -- Setup rust_analyzer with detailed configuration
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              command = "clippy",
              extraArgs = { "--all", "--all-targets" }
            },
            diagnostics = {
              enable = true,
              experimental = {
                enable = true
              },
            },
            inlayHints = {
              enable = true,
              showParameterNames = true,
              parameterHintsPrefix = "<- ",
              otherHintsPrefix = "=> ",
            },
            hover = {
              enable = true,
              actions = {
                enable = true,
                debug = true,
                gotoTypeDef = true,
                implementations = true,
                references = true,
              },
            },
            completion = {
              enable = true,
              addCallParenthesis = true,
              addCallArgumentSnippets = true,
              postfix = {
                enable = true,
              },
              autoimport = {
                enable = true,
              },
            },
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            procMacro = {
              enable = true,
              ignored = {},
            },
          }
        }
      })

      -- Setup nvim-cmp for autocompletion
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },
      })
    end,
  }
}
