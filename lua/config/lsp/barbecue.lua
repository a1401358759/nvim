-- https://github.com/utilyre/barbecue.nvim

local public = require("utils.public")
local icons = public.get_icons("lsp_kind", true)

local M = {
    requires = {
        "barbecue",
    },
}

function M.before() end

function M.load()
    M.barbecue.setup({
        ---whether to attach navic to language servers automatically
        attach_navic = true,
        ---whether to create winbar updater autocmd
        create_autocmd = true,
        ---buftypes to enable winbar in
        include_buftypes = { "" },
        ---filetypes not to enable winbar in
        exclude_filetypes = { "toggleterm" },
        modifiers = {
            ---filename modifiers applied to dirname
            dirname = ":~:.",
            ---filename modifiers applied to basename
            basename = "",
        },
        ---returns a string to be shown at the end of winbar
        ---@type fun(bufnr: number): string
        custom_section = function()
            return ""
        end,
        ---whether to replace file icon with the modified symbol when buffer is modified
        ---@type boolean
        show_modified = true,
        symbols = {
            ---modification indicator
            ---@type string
            modified = "●",
            ---truncation indicator
            ---@type string
            ellipsis = "…",
            ---entry separator
            ---@type string
            separator = ">",
        },
        -- kinds = icons,
    })
end

function M.after() end

return M
