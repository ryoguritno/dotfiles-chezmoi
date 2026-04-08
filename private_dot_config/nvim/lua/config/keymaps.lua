-- LazyVim keymaps for HP laptop
-- Location: ~/.config/nvim/lua/config/keymaps.lua (add to existing file)

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- HP laptop friendly leader key remaps
keymap.set("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better navigation for HP laptop
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window resizing (HP laptop optimized)
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation (laptop friendly)
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)

-- Tab management
keymap.set("n", "<leader>tn", ":tabnew<CR>", opts)
keymap.set("n", "<leader>tc", ":tabclose<CR>", opts)
keymap.set("n", "<leader>to", ":tabonly<CR>", opts)

-- Alt+number for buffer switching (HP laptop)
keymap.set("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opts)
keymap.set("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opts)
keymap.set("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opts)
keymap.set("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opts)
keymap.set("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opts)

-- Quick save and quit
keymap.set("n", "<leader>w", ":w<CR>", opts)
keymap.set("n", "<leader>q", ":q<CR>", opts)
keymap.set("n", "<leader>Q", ":qa!<CR>", opts)

-- Terminal toggle (works great with tmux)
keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", opts)
keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)

-- File explorer
keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts)
keymap.set("n", "<leader>o", ":Neotree focus<CR>", opts)

-- Telescope (fuzzy finder)
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)

-- LSP keybindings (HP laptop optimized)
keymap.set("n", "gd", vim.lsp.buf.definition, opts)
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
keymap.set("n", "gr", vim.lsp.buf.references, opts)
keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
keymap.set("n", "K", vim.lsp.buf.hover, opts)
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

-- Diagnostic navigation
keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

-- Visual mode improvements
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Search improvements
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- HP laptop function keys
keymap.set("n", "<F5>", ":source %<CR>", opts)
keymap.set("n", "<F6>", ":Lazy<CR>", opts)
keymap.set("n", "<F7>", ":Mason<CR>", opts)

-- Split management
keymap.set("n", "<leader>sv", "<C-w>v", opts) -- Split vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts) -- Split horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts) -- Make splits equal size
keymap.set("n", "<leader>sx", ":close<CR>", opts) -- Close current split

-- Quick commands
keymap.set("n", "<leader>so", ":source %<CR>", opts)
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- Clipboard (HP laptop)
keymap.set("v", "<leader>y", '"+y', opts)
keymap.set("n", "<leader>Y", '"+Y', opts)
keymap.set("n", "<leader>p", '"+p', opts)
keymap.set("n", "<leader>P", '"+P', opts)

