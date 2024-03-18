-- Set PowerShell as the shell to use
vim.o.shell = vim.fn.executable('pwsh') and 'pwsh' or 'powershell'

-- Configure the flags for the shell command, ensuring to use double backslashes for escape sequences in Lua
vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '

-- These settings are for setting the quote character for the shell, which is empty in your case
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- Configure shellpipe and shellredir for redirecting output in PowerShell syntax
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellredir = '| Out-File -Encoding UTF8 %s'

require("theprimeagen")
