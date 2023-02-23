require("core.options")
require("core.keymaps")
require("plugins.plugins-setup") --Packer是用来管理插件的插件
require("plugins.lualine") --状态栏
require("plugins.nvim-tree") --文件树
require("plugins.treesitter") -- 
require("plugins.lsp") --语言服务协议，主要用于各种编程语言的语法高亮
require("plugins.cmp") --自动补全
require("plugins.comment") --便捷注释代码
require("plugins.autopairs") --括号自动配对
require("plugins.bufferline") -- Buff状态栏，显示最近打开的所有文件
require("plugins.gitsigns") --git信息提示
require("plugins.telescope") --文件查找
