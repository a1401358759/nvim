-- https://github.com/sainnhe/gruvbox-material

local options = require("core.options")

local M = {}

function M.before() end

function M.load()
    vim.g.gruvbox_material_foreground = "material" -- "material"、"mix"、"original"
    vim.g.gruvbox_material_background = "soft" -- Available values: 'hard', 'medium'(default), 'soft'
    vim.g.gruvbox_material_disable_italic_comment = 1 -- By default, italic is enabled in `Comment`. To disable italic in `Comment`, set this option to 1
    vim.g.gruvbox_material_enable_bold = 0 -- To enable bold in function name just like the original gruvbox, set this option to 1
    vim.g.gruvbox_material_enable_italic = 0 -- To enable italic in this color scheme, set this option to 1
    vim.g.gruvbox_material_transparent_background = options.transparent -- To use transparent background, set this option to 1
    vim.g.gruvbox_material_visual = "grey background" -- Available values: 'grey background', 'green background', 'blue background', 'red background', 'reverse'
    vim.g.gruvbox_material_show_eob = 0 -- Available values: 1, 0
    vim.g.gruvbox_material_menu_selection_background = "grey" -- Available values: 'grey', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
    -- By default, the color of sign column background is the same as normal text
    -- background, but you can use a grey background by setting this option to `'grey'`.
    vim.g.gruvbox_material_sign_column_background = "none" -- none, grey
    vim.g.gruvbox_material_spell_foreground = "colored" -- 'none', 'colored'
    vim.g.gruvbox_material_ui_contrast = "high" -- 'low', 'high'
    vim.g.gruvbox_material_diagnostic_text_highlight = 0 -- 0, 1
    vim.g.gruvbox_material_diagnostic_line_highlight = 0 -- 0, 1
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored" -- 'grey', 'colored'
    vim.g.gruvbox_material_current_word = "grey background" -- 'grey background', 'bold', 'underline', 'italic'
    vim.g.gruvbox_material_disable_terminal_colors = 0 -- 0, 1
    vim.g.gruvbox_material_statusline_style = "material" -- 'default', 'mix', 'original'
    vim.g.gruvbox_material_lightline_disable_bold = 0 -- 0, 1
    vim.g.gruvbox_material_better_performance = 1 -- 0, 1
    -- vim.g.gruvbox_material_colors_override = {'bg0': ['#1d2021', '234'], 'bg2': ['#282828', '235']}
end

function M.after()
    vim.cmd([[colorscheme gruvbox-material]])
end

return M
