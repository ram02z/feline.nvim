local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local api = vim.api

local M = {
    components = {
        active = {},
        inactive = {}
    }
}

M.components.active[1] = {
    {
        provider = '▊ ',
        hl = {
            fg = 'skyblue'
        }
    },
    {
        provider = 'vi_mode',
        hl = function()
            return {
                name = vi_mode_utils.get_mode_highlight_name(),
                fg = vi_mode_utils.get_mode_color(),
                style = 'bold'
            }
        end,
        right_sep = ' ',
        icon = ''
    },
    {
        provider = 'file_info',
        hl = {
            fg = 'white',
            bg = 'oceanblue',
            style = 'bold'
        },
        left_sep = '',
        right_sep = ' ',
        icon = ''
    },
    {
        provider = 'file_size',
        right_sep = {
            ' ',
            {
                str = 'vertical_bar_thin',
                hl = {
                    fg = 'fg',
                    bg = 'bg'
                }
            },
        }
    },
    {
        provider = 'position',
        left_sep = ' ',
        right_sep = {
            ' ',
            {
                str = 'vertical_bar_thin',
                hl = {
                    fg = 'fg',
                    bg = 'bg'
                }
            }
        }
    },
    {
        provider = 'diagnostic_errors',
        enabled = function(winid) return
            lsp.diagnostics_exist('Error', api.nvim_win_get_buf(winid))
        end,
        hl = { fg = 'red' },
        icon = ' E-'
    },
    {
        provider = 'diagnostic_warnings',
        enabled = function(winid) return
            lsp.diagnostics_exist('Warning', api.nvim_win_get_buf(winid))
        end,
        hl = { fg = 'yellow' },
        icon = ' W-'
    },
    {
        provider = 'diagnostic_hints',
        enabled = function(winid) return
            lsp.diagnostics_exist('Hint', api.nvim_win_get_buf(winid))
        end,
        hl = { fg = 'cyan' },
        icon = ' H-'
    },
    {
        provider = 'diagnostic_info',
        enabled = function(winid) return
            lsp.diagnostics_exist('Information', api.nvim_win_get_buf(winid))
        end,
        hl = { fg = 'skyblue' },
        icon = ' I-'
    }
}

M.components.active[2] = {
    {
        provider = 'git_branch',
        hl = {
            fg = 'white',
            bg = 'black',
            style = 'bold'
        },
        right_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'black'
            }
        },
        icon = ' '
    },
    {
        provider = 'git_diff_added',
        hl = {
            fg = 'green',
            bg = 'black'
        },
        icon = ' +'
    },
    {
        provider = 'git_diff_changed',
        hl = {
            fg = 'orange',
            bg = 'black'
        },
        icon = ' ~'
    },
    {
        provider = 'git_diff_removed',
        hl = {
            fg = 'red',
            bg = 'black'
        },
        right_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'black'
            }
        },
        icon = ' -'
    },
    {
        provider = 'line_percentage',
        hl = {
            style = 'bold'
        },
        left_sep = '  ',
        right_sep = ' '
    },
    {
        provider = 'scroll_bar',
        hl = {
            fg = 'skyblue',
            style = 'bold'
        }
    }
}

M.components.inactive[1] = {
    {
        provider = 'file_type',
        hl = {
            fg = 'white',
            bg = 'oceanblue',
            style = 'bold'
        },
        left_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'oceanblue'
            }
        },
        right_sep = {
            {
                str = ' ',
                hl = {
                    fg = 'NONE',
                    bg = 'oceanblue'
                }
            },
            ' '
        }
    }
}

return M
