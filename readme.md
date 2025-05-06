# Neovim config

This is my personal neovim config. It's a bit of a mess, but it works for me.

## Installation

1. Git clone this repo to `~/AppData/Local/nvim`
2. Run `nvim` to start neovim
3. Run :MasonInstallAll
4. Finish

Note: I make lazy.nvim only load file plugins/out/plugins.lua. This is because for some reason, Neovim read file so slowly that it effect startup time
so i make custom command to load all change in plugins/ to plugins/out/plugins.lua with command :ReloadPlugins so every time i change something in plugins/ it nead to be reloaded
