-- 使用packer来管理neovim的插件，以下配置来自packer github
-- https://github.com/wbthomason/packer.nvim/blob/master/README.md
-- Only required if you have packer configured as `opt`
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--保存此文件自动更新安装插件
-- 注意PackerCompile改成来PackerSync
-- plugins.lua改成了 plugin-setup.lua,适应本地文件名
-- 下面的代码可能有些问题，目前不支持自动安装插件，手动敲入 PackerSync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim' --主题 github search tokynight
  use {
  'nvim-lualine/lualine.nvim',--状态栏
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
  use {
  'nvim-tree/nvim-tree.lua', --文档树
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  use 'christoomey/vim-tmux-navigator' --ctrl hjkl 在文档数和代码窗口之间切换
  use 'nvim-treesitter/nvim-treesitter' --语法高亮
  use 'p00f/nvim-ts-rainbow' --配合treesitter,不同括号颜色区分
  use {
    "williamboman/mason.nvim",
     "williamboman/mason-lspconfig.nvim", --这个相当于mason和lspconfig的桥梁
     "neovim/nvim-lspconfig"
    }
  -- 自动补全
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("L3MON4D3/LuaSnip") -- snippets引擎，不装这个会出问题
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")
  use("hrsh7th/cmp-path") --文件路径

  use("numToStr/Comment.nvim") --gcc和gc注释
  use("windwp/nvim-autopairs") --自动补全括号

  use("akinsho/bufferline.nvim") --buffer分割线
  use("lewis6991/gitsigns.nvim") --左侧git提示

  use { --基本的文件搜索和关键字查找 文件路径查找
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
