-- https://github.com/nvim-treesitter/nvim-treesitter

local options = require("core.options")

local M = {
    requires = {
        "nvim-treesitter.configs",
        "nvim-treesitter.parsers",
        "nvim-treesitter.install",
    },
}

function M.download_source_settings()
    local default_source = "https://github.com/"

    if options.download_source ~= default_source then
        for _, config in pairs(M.nvim_treesitter_parsers.get_parser_configs()) do
            config.install_info.url = config.install_info.url:gsub(default_source, options.download_source)
        end
    end
end

function M.before() end

function M.load()
    M.download_source_settings()
    M.nvim_treesitter_install.prefer_git = true

    M.nvim_treesitter_configs.setup({
        ensure_installed = {
            "bash",
            "blueprint",
            "c",
            "cmake",
            "comment",
            "cpp",
            "css",
            "cuda",
            "dockerfile",
            "dot",
            "fish",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "go",
            "gomod",
            "hjson",
            "html",
            "http",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "json5",
            "jsonc",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "ninja",
            "python",
            "ruby",
            "rust",
            "scss",
            "sql",
            "toml",
            "typescript",
            "vim",
            "vue",
            "yaml",
        },
        ignore_install = { "phpdoc", "julia", "hcl", "c_sharp" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = { "yaml", "python", "html", "vue" },
        },
        -- incremental selection
        incremental_selection = {
            enable = false,
            keymaps = {
                init_selection = "<cr>",
                node_incremental = "<cr>",
                node_decremental = "<bs>",
                scope_incremental = "<tab>",
            },
        },
        -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true,
            -- Do not enable for files with more than 1000 lines, int
            max_file_lines = 1000,
        },
        -- nvim-ts-autotag
        autotag = {
            enable = true,
        },
        -- nvim-ts-context-commentstring
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    })
end

function M.after() end

return M
