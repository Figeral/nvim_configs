return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "mxsdev/nvim-dap-vscode-js",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    
    -- Setup DAP UI
    dapui.setup()
    
    -- Setup virtual text
    require("nvim-dap-virtual-text").setup()
    
    -- Configure Node.js debugging
    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
    }
    
    -- React/TypeScript configurations
    dap.configurations.typescript = {
      {
        name = "Launch React App",
        type = "node2",
        request = "launch",
        program = "${workspaceFolder}/node_modules/react-scripts/scripts/start.js",
        cwd = "${workspaceFolder}",
        env = { NODE_ENV = "development" },
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
      {
        name = "Attach to Chrome",
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}",
      },
    }
    
    dap.configurations.typescriptreact = dap.configurations.typescript
    
    -- Auto open/close DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
