## Dependencies 

Install Neovim     
`winget install Neovim.Neovim`

Clone NVChad       
`git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1`

Windows BuildTools:<br>
https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170

Rust                
`rustup`

Rust-Analyzer     
`rustup add component rust-analyzer`

Julia              
`winget install julia -s msstore`

Locate Julia PATH   
`(Get-Command julia).Source`
-> Update path in [lspconfig.lua](https://github.com/Ping-uin/dotfiles/nvim/lua/custom/configs/lspconfig.lua) if needed

In Julia REPL 
```
using Pkg 
Pkg.add("LanguageServer")
```

## Nvim commands

Install syntax highlighting for languages
`:TSInstall [lang]`

Check available syntax highlighting
`:TSInstallInfo`

Paketmanager
`:MasonInstall [pkg]`
`:MasonInstallAll`

Plugin-Manager
`:Lazy sync`
