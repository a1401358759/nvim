local aid_packer = require("utils.aid.packer")

local plugins = {}

plugins.basic = {
    { "goolord/alpha-nvim" }, -- start
    { "wbthomason/packer.nvim" },
    { "rcarriga/nvim-notify" },
    { "tpope/vim-repeat" },
    { "nvim-lua/plenary.nvim", module = "plenary" },
    { "williamboman/mason.nvim", after = { "nvim-notify" } },
    { "nvim-treesitter/nvim-treesitter", module = "nvim-treesitter", run = { ":TSUpdate" } },
    { "nvim-tree/nvim-web-devicons", module = "nvim-web-devicons" },
}

plugins.theme = {
    { "sainnhe/gruvbox-material", commit = "3711f1f6b7b2b32a668753b0bf8f14685161a037"},
    { "askfiy/starlight", disable = true },
}

plugins.lsp = {
    { "williamboman/mason-lspconfig.nvim", after = { "mason.nvim" } },
    { "folke/neodev.nvim", after = { "mason-lspconfig.nvim" } },
    { "SmiteshP/nvim-navic", after = { "neodev.nvim" } },
    { "neovim/nvim-lspconfig", after = { "nvim-navic" } },
    { "j-hui/fidget.nvim", after = { "nvim-lspconfig" } },
    { "kosayoda/nvim-lightbulb", after = { "nvim-lspconfig" } },
    { "jose-elias-alvarez/null-ls.nvim", after = { "nvim-lspconfig" } },
    { "kkharji/lspsaga.nvim" },
}

plugins.complete = {
    { "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } },
    { "hrsh7th/vim-vsnip", after = { "friendly-snippets" } },
    { "hrsh7th/nvim-cmp", after = { "vim-vsnip" } },
    { "hrsh7th/cmp-vsnip", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-buffer", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-path", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-cmdline", after = { "nvim-cmp" } },
    { "kristijanhusak/vim-dadbod-completion", after = { "nvim-cmp" } },
    { "tzachar/cmp-tabnine", run = "./install.sh", after = { "nvim-cmp" } },
    -- { "github/copilot.vim", ft = { "dap-repl" }, event = { "InsertEnter" } },
}

plugins.dap = {
    { "mfussenegger/nvim-dap", module = "dap" },
    { "theHamsta/nvim-dap-virtual-text", after = { "nvim-dap" } },
    { "rcarriga/nvim-dap-ui", after = { "nvim-dap" } },
}
plugins.editor = {
    { "mrjones2014/nvim-ts-rainbow" },
    { "AndrewRadev/switch.vim" },
    { "jbyuki/venn.nvim", module = "venn" },
    { "windwp/nvim-autopairs", event = { "InsertEnter" } },
    { "ur4ltz/surround.nvim", event = { "BufRead", "BufNewFile" } },
    { "RRethy/vim-illuminate", event = { "BufRead", "BufNewFile" } },
    { "lukas-reineke/indent-blankline.nvim", after = { "nvim-treesitter" } },
    { "windwp/nvim-ts-autotag", after = { "nvim-treesitter" } },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter" } },
    {
        "numToStr/Comment.nvim",
        module = { "Comment" },
        after = { "nvim-ts-context-commentstring" },
    },
    {
        "mg979/vim-visual-multi",
        fn = { "vm#commands#add_cursor_up", "vm#commands#add_cursor_down" },
        keys = { "<c-n>" },
    },
}

plugins.language = {
    { "davidgranstrom/nvim-markdown-preview", ft = { "markdown" } },
    { "Vimjas/vim-python-pep8-indent", ft = { "python" }, event = { "InsertEnter" } },
}

plugins.find = {
    { "kkharji/sqlite.lua" },
    { "kevinhwang91/nvim-hlslens" },
    { "nvim-telescope/telescope.nvim" },
    { "AckslD/nvim-neoclip.lua", after = { "sqlite.lua" } },
    { "phaazon/hop.nvim", cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" } },
    { "folke/todo-comments.nvim", event = { "BufRead", "BufNewFile" } },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make", module = { "telescope._extensions.fzf" } },
    { "kevinhwang91/rnvimr", after = { "nvim-web-devicons" } },
}

plugins.tools = {
    { "voldikss/vim-translator" },
    { "olimorris/persisted.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "askfiy/nvim-picgo", module = "nvim-picgo" },
    { "kristijanhusak/vim-carbon-now-sh", cmd = { "CarbonNowSh" } },
    { "lewis6991/gitsigns.nvim", event = { "BufRead", "BufNewFile" } },
    { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
    { "folke/which-key.nvim", event = { "BufRead", "BufNewFile" } },
    { "michaelb/sniprun", run = "bash ./install.sh" },
    { "folke/trouble.nvim" },
}

plugins.views = {
    { "nvim-lualine/lualine.nvim", after = { "nvim-web-devicons" } },
    { "stevearc/aerial.nvim", after = { "lualine.nvim" } },
    { "nvim-pack/nvim-spectre", module = "spectre" },
    { "mbbill/undotree", event = { "BufRead", "BufNewFile" } },
    { "nvim-tree/nvim-tree.lua", cmd = { "NvimTreeToggle", "NvimTreeFindFile" } },
    { "akinsho/bufferline.nvim", events = { "BufNewFile", "BufRead", "TabEnter" } },
    { "tpope/vim-dadbod", fn = { "db#resolve" } },
    { "kristijanhusak/vim-dadbod-ui", cmd = { "DBUIToggle" } },
    { "dstein64/nvim-scrollview", event = { "BufRead", "BufNewFile" } },
    { "akinsho/toggleterm.nvim", module = "toggleterm" },
    {
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    {
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = { "nvim-web-devicons", "nvim-navic" }, -- keep this if you're using NvChad
    },
}

aid_packer.entry(plugins)

return plugins
