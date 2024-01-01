# MyNvim
I've started to use NVim to replace my previous IDE, I felt in love with the endless configurations, plugins and so on. In this repository, you can find my configuration done in lua for Nvim. 

## Description

NeoVim config inspired from https://github.com/ThePrimeagen/init.lua,
Built with Lua.

## Getting Started
### Dependencies
* Describe any prerequisites, libraries, OS version, etc., needed before insAtalling program.
* Prerequisites
    * 
## Getting Started

### Dependencies
Before installing and using this Neovim configuration, ensure you have the following dependencies:
* **Neovim**: Make sure you have Neovim installed.
* **Node.js**: Required for several Neovim plugins.
* **Python**: Required for Neovim plugins and some language servers.
* **Git**: Required for managing plugins and version control-related plugins.
* **Telescope dependencies**: The `nvim-telescope/telescope.nvim` plugin might require additional dependencies based on the modules you choose to use. Check the Telescope documentation for any additional requirements.
* **Language Servers**: Since you are using LSP (Language Server Protocol), you'll need to install language servers for the languages you work with. For example:
    - JavaScript/TypeScript: `npm install -g typescript typescript-language-server`
    - Python: `pip install python-language-server`
    - Go: `go get golang.org/x/tools/gopls`
    - etc.
* **Additional tools for specific plugins**:
    - **Fugitive (Git)**: Git needs to be installed.
    - **LSP Zero and related plugins**: Various language servers. Refer to their documentation for specific requirements.
    - **DAP (Debug Adapter Protocol) and related plugins**: Depends on the languages you are debugging. Check the respective DAP adapters and install the required tools.
    - **Advanced Git Search**: Requires `rg` (ripgrep) to be installed.
    - **Jupyter-vim**: Jupyter needs to be installed.

### Installing

* Copy file init.nvim, lua and after to ~/.config/nvim/ (depending on your os system can be a different path)
* Check packer documentation for more information how to install it and run. 

### Executing program
```
nvim
```
## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors
Micael Carvalho (MicaelMCarvalho)

## Version History
* 0.1
    * Initial Release

## License


## Acknowledgments
The [ThePrimeagen](https://github.com/ThePrimeagen/) for the inspiration to start to use nvim
