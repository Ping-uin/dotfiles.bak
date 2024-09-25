local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.julials.setup {
  on_new_config = function(new_config, _)
    local julia = vim.fn.expand("$LOCALAPPDATA\\Microsoft\\WindowsApps\\julia.exe")
    if lspconfig.util.path.is_file(julia) then
      vim.notify("Hello, I found a Julia executable!")
      new_config.cmd[1] = julia
    end
  end,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "julia" },
  root_dir = function(fname)
    return util.root_pattern "Project.toml"(fname) or util.find_git_ancestor(fname)
  end,
  single_file_support = true,
}
