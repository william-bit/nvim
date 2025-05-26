local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- general options ------------------------------------------
o.laststatus = 3 -- global statusline
o.showmode = false -- Dont show mode since we have a statusline

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "both"

-- Indenting
o.expandtab = true  -- Use spaces instead of tabs
o.shiftwidth = 2  -- Size of an indent
o.smartindent = true
o.tabstop = 2 -- Number of spaces tabs count for
o.softtabstop = 2 -- Indenting

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true  -- Print line number
o.numberwidth = 2 -- Numbers
o.ruler = false -- Disable the default ruler

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.timeoutlen = 400 -- Lower than default (1000) to quickly trigger which-key
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250 -- Save swap file and trigger CursorHold and interval for writing swap file to disk, also used by gitsigns

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

opt.spelllang = { "en_us" } -- setup spell check

-- disable netrw at the very start of your init.lua
g.loaded = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_tutor_mode_plugin = 1

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

vim.cmd [[
  "set up powershell as shell
  let &shell = executable('pwsh') ? 'pwsh -NoLogo' : 'powershell -NoLogo'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=

  "highlight yanked text for 200ms using the "Visual" highlight group
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END

  "Change to directory given as argument
  if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif
]]

-------------------------------------- Fold Setting ------------------------------------------
-- statusColumn config get from https://github.com/neovim/neovim/pull/17446
-- example (https://neovim.io/doc/user/options.html#'statuscolumn'):
-- example2 (https://www.reddit.com/r/neovim/comments/1djjc6q/statuscolumn_a_beginers_guide/)

o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 20
o.foldenable = true

local statusColumnStyle = 'minimal'
if statusColumnStyle == "minimal" then
  o.statuscolumn =
    '%s%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " } %l %='
else
  o.statuscolumn =
    '%s%{foldlevel(v:lnum) > 0 ? (foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▾" : "▸") : (foldlevel(v:lnum) > foldlevel(v:lnum + 1) ? (foldlevel(v:lnum + 1) == 0 ? "└" : "├") : "│" )) : " " } %l %='
end


-------------------------------------- user options ------------------------------------------

o.autowrite = true -- Enable auto write
o.completeopt = "menu,menuone,noselect"
o.omnifunc = "v:lua.vim.lsp.omnifunc"
o.conceallevel = 0 -- Hide * markup for bold and italic, but not markers with substitutions
o.confirm = true -- Confirm to save changes before exiting modified buffer

-- wait time
o.ttimeout = true
o.ttimeoutlen = 100


-- Enable highlighting of the current line
o.list = true -- Show some invisible characters (tabs...
o.synmaxcol = 300 -- stop syntax highlight after x lines for performance
o.formatexpr = "v:lua.require'conform'.formatexpr()"
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"
o.ignorecase = true -- Ignore case
o.inccommand = "nosplit" -- preview incremental substitute
o.jumpoptions = "view"
o.laststatus = 3
o.linebreak = true -- Wrap lines at convenient points
o.mouse = "a" -- Enable mouse mode
o.number = true
o.pumblend = 10 -- Popup blend
o.pumheight = 10 -- Maximum number of entries in a popup
o.relativenumber = true -- Relative line numbers
o.scrolloff = 4 -- Lines of context
o.shiftround = true -- Round indent
o.sidescrolloff = 8 -- Columns of context
o.smartcase = true -- Don't ignore case with capitals
o.splitkeep = "screen"
o.splitright = true
o.termguicolors = true -- True color support
o.undolevels = 10000
o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5 -- Minimum window width
o.wrap = false -- Disable line wrap

-------------------------------------- indentation options ------------------------------------------
o.expandtab = true
o.smartindent = false -- Insert indents automatically
o.autoindent = false -- Copy indent from current line
