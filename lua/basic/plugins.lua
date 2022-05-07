-- https://github.com/wbthomason/packer.nvim
local packer = require("packer")
packer.startup(
{
	-- 所有插件的安装都书写在 function 中
        function(use)
		-- 包管理器
        	use {
                	"wbthomason/packer.nvim"
	        }
	        -- 中文文档
	        use {
                	"yianwillis/vimcdoc",
	        }
		use {
			"lewis6991/impatient.nvim",
			config = function()
				require("conf.impatient")
			end
		}
		-- nvim-tree
		use {
			"kyazdani42/nvim-tree.lua",
			requires = {
		        -- 依赖一个图标插件
			        "kyazdani42/nvim-web-devicons"
			},
			cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
			config = function()
		        -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
			        require("conf.nvim-tree")
			end
		}
		use {
			"akinsho/bufferline.nvim",
			event = "BufEnter",
			after ="nvim-web-devicons",
			config = function()
				require("conf.bufferline")
			end
		}
		use {
			"famiu/bufdelete.nvim",
			after = {"bufferline.nvim"},
			cmd = {"Bdelete"},
		}
		-- 优秀的暗色主题
		use {
			"catppuccin/nvim",
			-- 改个别名，因为它的名字是 nvim，可能会冲突
			as = "catppuccin",
			config = function()
		        -- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
		        	require("conf.catppuccin")
			end
		}
		use {
			"nvim-treesitter/nvim-treesitter",
			event = {"BufRead", "BufNewFile"},
			after = "impatient.nvim",
			run = ":TSUpdate",
			config = function()
				require("conf.nvim-treesitter")
			end
		}
		use {
			"SmiteshP/nvim-gps",
			after = "nvim-treesitter",
			config = function()
				require("conf.lualine")
			end
		}
		use {
			"nvim-lualine/lualine.nvim",
			after = "nvim-web-devicons",
			config = function()
				require("conf.lualine")
			end
		}
		use {
			"petertriho/nvim-scrollbar",
			after = "impatient.nvim",
			config = function()
				require("conf.nvim-scrollbar")
			end
		}
		use {
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = {"BufRead", "BufNewFile"},
			after = "impatient.nvim",
		}
		use {
			"numToStr/Comment.nvim",
			after = "nvim-ts-context-commentstring",
			config = function()
				require("conf.Comment")
			end
		}
		use {
			"nvim-lua/plenary.nvim",
			event = {"BufRead", "BufNewFile"},
			after = {"impatient.nvim"},
		}
		use {
			"onsails/lspkind-nvim",
			after = "impatient.nvim",
			config = function()
				require("conf.lspkind-nvim")
			end
		}
		use {
			"neovim/nvim-lspconfig",
			event = {"BufRead", "BufNewFile"},
			after = {"impatient.nvim"},
		}
		use {
			"stevearc/aerial.nvim",
			after = {"nvim-lspconfig", "nvim-web-devicons", "lspkind-nvim"},
			config = function()
				require("conf.aerial")
			end
		}
		use {
			"hrsh7th/cmp-nvim-lsp",
			after = {"nvim-lspconfig", "nvim-web-devicons"},
		}
		use {
			"williamboman/nvim-lsp-installer",
			after = {"cmp-nvim-lsp", "aerial.nvim"},
			config = function()
				require("conf.nvim-lsp-installer")
			end
		}
--		use {
--			"simrat39/rust-tools.nvim",
--			cmd = {"RustHoverActions","RustJoinLines"},
--			after = "nvim-lspconfig",
--			config = function ()
--				require("conf.rust-tools")
--			end
--		}
		use {
			"j-hui/fidget.nvim",
			after = {"nvim-lsp-installer"},
			config = function()
				require("conf.fidget")
			end
		}
		use {
			"tami5/lspsaga.nvim",
			after = {"nvim-lsp-installer"},
			config = function()
				require("conf.lspsaga")
			end
		}
		use {
			"mfussenegger/nvim-lint",
			after = {"nvim-lsp-installer"},
			config = function()
				require("conf.nvim-lint")
			end
		}
		use {
			"kosayoda/nvim-lightbulb",
			after = {"nvim-lsp-installer"},
			config = function()
				require("conf.nvim-lightbulb")
			end
		}
		use {
			"rafamadriz/friendly-snippets",
			after = {"impatient.nvim"},
			event = {"InsertEnter", "CmdlineEnter"},
		}
		use {
			"hrsh7th/vim-vsnip",
			after = {"friendly-snippets"},
			config = function()
				require("conf.nvim-lightbulb")
			end
		}
		use {
			"hrsh7th/nvim-cmp",
			after = {"lspkind-nvim", "vim-vsnip"},
			config = function()
				require("conf.nvim-cmp")
			end
		}
		use {
			"hrsh7th/cmp-vsnip",
			after = {"nvim-cmp"},
		}
		use {
			"hrsh7th/cmp-path",
			after = {"nvim-cmp"},
		}
		use {
			"hrsh7th/cmp-buffer",
			after = {"nvim-cmp"},
		}
		use {
			"hrsh7th/cmp-cmdline",
			after = {"nvim-cmp"},
		}
		use {
			"kristijanhusak/vim-dadbod-completion",
			after = {"nvim-cmp"},
			config = function()
				require("conf.vim-dadbod-ui")
			end
		}
		use {
			"nvim-telescope/telescope.nvim",
			module = "telescope",
			after = "nvim-web-devicons",
			config = function()
				require("conf.telescope")
			end
		}
		use {
			"akinsho/toggleterm.nvim",
			module = "toggleterm",
			after = {"impatient.nvim"},
			config = function ()
				require("conf.toggleterm")
			end
		}
		use {
			"windwp/nvim-autopairs",
			event = {"InsertEnter"},
			after = {"impatient.nvim"},
			config = function ()
				require("conf.nvim-autopairs")
			end
		}
		use {
			"ur4ltz/surround.nvim",
			event = {"BufRead", "BufNewFile"},
			after = {"impatient.nvim"},
			config = function ()
				require("conf.surround")
			end
		}






        end,
        -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
}
)
-- 实时生效配置
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)
