-- https://github.com/voldikss/vim-translator
-- :Translate                                  " translate the word under the cursor
-- :Translate --engines=google,youdao are you ok " translate text `are you ok` using google and youdao engines
-- :2Translate ...                             " translate line 2
-- :1,3Translate ...                           " translate line 1 to line 3
-- :'<,'>Translate ...                         " translate selected lines
-- Once the translation window is opened, type <C-w>p to jump into it and again to jump back

local api = require("utils.api")

local M = {}

function M.before()
    M.register_key()
end

function M.load()
    vim.g.translator_target_lang = "zh"
    vim.g.translator_source_lang = "auto"
    vim.g.translator_default_engines = { "bing", "youdao" }
    vim.g.translator_window_type = "popup" -- preview
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n", "v" },
            lhs = "<leader>tc",
            rhs = "<cmd>Translate<cr>",
            options = { silent = true },
            description = "Echo translation in the cmdline",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tw",
            rhs = "<cmd>TranslateW<cr>",
            options = { silent = true },
            description = "Display translation in a window",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tr",
            rhs = "<cmd>TranslateR<cr>",
            options = { silent = true },
            description = "Replace the text with translation",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tx",
            rhs = "<cmd>TranslateX<cr>",
            options = { silent = true },
            description = "Translate the text in clipboard",
        },
    })
end

return M
