require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!


------------------------------------------------------------------
-- Basic options
------------------------------------------------------------------
vim.opt.syntax = 'enable'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.numberwidth = 4
vim.opt.wrap = false
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.cmd('autocmd FileType python,javascript,typescript,c,cpp,java,html,css,pug setlocal foldmethod=syntax')
vim.cmd('set rtp+=/opt/homebrew/opt/fzf')
vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h16"
vim.opt.updatetime = 200


------------------------------------------------------------------
-- Functions
------------------------------------------------------------------
-- Compile & Run
function Compile()
  local filetype = vim.bo.filetype

  if filetype == "python" then
    vim.cmd('w')
    vim.cmd('TermExec cmd="python3 %<.py"')
    -- vim.cmd('set norelativenumber nonu')
  elseif filetype == "javascript" then
    vim.cmd('w')
    vim.cmd('TermExec cmd="node %<.js"')
  elseif filetype == "typescript" then
    vim.cmd('w')
    vim.cmd(':! tsc %<.ts --outDir ~/bin')
    vim.cmd('TermExec cmd="node ~/bin/%<.js"')
  elseif filetype == "c" then
    vim.cmd('w')
    vim.cmd(':! gcc -o ~/bin/% %<.c')
    vim.cmd('TermExec cmd="~/bin/%"')
  elseif filetype == "cpp" then
    vim.cmd('w')
    vim.cmd(':! g++ -o ~/bin/% %<.cpp')
    vim.cmd('TermExec cmd="~/bin/%"')
  elseif filetype == "java" then
    vim.cmd('w')
    vim.cmd(':! javac -encoding utf-8 -d ~/bin %<.java')
    vim.cmd('TermExec cmd="java -cp ~/bin %"')
  else
    vim.cmd(':echo "This file is not a source file."')
  end
end

-- Toggle Wrap
function Toggle_wrap()
  vim.cmd('set wrap!')
end
