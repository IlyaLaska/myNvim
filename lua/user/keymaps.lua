local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MODE --
-- Leader e to open NETRW file tree
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Better window navigation - hjkl to move between windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers with hl
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- -- Move text up and down
-- keymap("n", "<M-j>", ":m .+1<CR>==", opts)
-- keymap("n", "<M-k>", ":m .-2<CR>==", opts)

-- Quickly enter search and replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- TODO find out if possible to do that only for line comment but in plugins/mini.nvim
-- Remap mini.comment command to also go down a line when commenting one line
-- keymap('n', 'gcc', function() return MiniComment.operator() .. '_j' end, { expr = true, desc = 'Comment line' })

-- Yank into system clipboard with leader y
keymap({"n", "v"}, "<leader>y", [["+y]], opts)
keymap({"n", "v"}, "<leader>yy", [["+yy]], opts)
keymap({"n", "v"}, "<leader>Y", [["+Y]], opts)

-- Do not save deleted lines with leader d
keymap({"n", "v"}, "<leader>d", [["_d]], opts)
keymap({"n", "v"}, "<leader>dd", [["_dd]], opts)
keymap({"n", "v"}, "<leader>D", [["_D]], opts)
-- Do not save cut lines with leader c
keymap({"n", "v"}, "<leader>c", [["_c]], opts)
keymap({"n", "v"}, "<leader>cc", [["_cc]], opts)
keymap({"n", "v"}, "<leader>C", [["_C]], opts)

-- INSERT MODE --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Remap Ctrl-C to Esc to get rid of weird Ctrl-C behaviour
keymap("i", "<C-c>", "<Esc>", opts)


-- VISUAL MODE --
-- Stay in indent mode when moving text left/right
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- -- Move selected text up and down with Alt - jk
-- keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
-- keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- TODO let one of these die
-- Do not overwrite register on paste
keymap({"v", "x"}, "p", '"_dP', opts)
-- keymap({"v", "x"}, "<leader>p", '"_dP', opts)

-- VISUAL BLOCK MODE --
-- -- Move text up and down
-- keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
-- keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
-- keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
-- keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
