--设置主键/修饰键位空格键
vim.g.mapleader = " "
local keymap = vim.keymap

-- -----插入模式----
-- 将退出插入模式的ESC键改为 jk 键
-- keymap.set("i", "jk", "<ESC>")

-- -----视觉模式----
-- step1. 按v进入visual模式，h j k l 选择范围，shift+k,shift+j上下移动代码块
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- -----正常模式----
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") --add new split vertical window
keymap.set("n", "<leader>sh", "<C-w>s") --add new spiit horizontally window

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- ------------插件------------------
-- vim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- 切换Buff,buffline plugin keymap
keymap.set("n", "<leader>l", ":bnext<CR>") -- CTRL+SHIFT+l not success on macbook pro
keymap.set("n", "<leader>h", ":bprevious<CR>") --CTRL+SHIFT+h not succes macbook pro
