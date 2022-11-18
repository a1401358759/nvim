local api = require("utils.api")

local M = {}

function M.before()
    M.register_key()
end

function M.load()
    local ok, m = pcall(require, "lspsaga")
    if not ok then
        return
    end

    m.init_lsp_saga()

    M.lspsaga = m
    M.lspsaga.setup({
        -- 提示边框样式：round、single、double
        border_style = "round",
        error_sign = " ",
        warn_sign = " ",
        hint_sign = " ",
        infor_sign = " ",
        diagnostic_header_icon = " ",
        -- 正在写入的行提示
        code_action_icon = " ",
        code_action_prompt = {
            -- 显示写入行提示
            -- 如果为 true ，则写代码时会在左侧行号栏中显示你所定义的图标
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        -- 快捷键配置
        code_action_keys = {
            quit = "<Esc>",
            exec = "<CR>",
        },
        rename_action_keys = {
            quit = "<Esc>",
            exec = "<CR>",
        },
        finder_action_keys = {
            open = "<CR>", vsplit = "v", split = "i",quit = "<Esc>", scroll_down = "<C-f>", scroll_up = "<C-b>" -- quit can be a table
        },
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>ca",
            rhs = ":Lspsaga code_action<CR>",
            options = { silent = true },
            description = "Show code action",
        },
        {
            mode = { "n" },
            lhs = "<leader>cn",
            rhs = ":Lspsaga rename<CR>",
            options = { silent = true },
            description = "Variable renaming",
        },
        {
            mode = { "n" },
            lhs = "gh",
            rhs = ":Lspsaga lsp_finder<CR>",
            options = { silent = true },
            description = "Async Lsp Finder",
        },
        {
            mode = { "n" },
            lhs = "K",
            rhs = ":Lspsaga hover_doc<CR>",
            options = { silent = true },
            description = "show hover doc",
        },
        {
            mode = { "n" },
            lhs = "<leader>gs",
            rhs = ":Lspsaga signature_help<CR>",
            options = { silent = true },
            description = "show signature help",
        },
    })
end

return M
