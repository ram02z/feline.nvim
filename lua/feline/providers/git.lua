local api = vim.api

local M = {}

function M.git_branch(_, winid)
    local ok, head = pcall(api.nvim_buf_get_var, api.nvim_win_get_buf(winid), 'gitsigns_head')

    if not ok then head = vim.g.gitsigns_head or '' end
    return head, ' '
end

-- Common function used by the git providers
local function git_diff(winid, type)
    local ok, gsd = pcall(api.nvim_buf_get_var, api.nvim_win_get_buf(winid), 'gitsigns_status_dict')

    if ok and gsd[type] and gsd[type] > 0 then
        return tostring(gsd[type])
    end

    return ''
end

function M.git_diff_added(_, winid)
    return git_diff(winid, 'added'), '  '
end

function M.git_diff_removed(_, winid)
    return git_diff(winid, 'removed'), '  '
end

function M.git_diff_changed(_, winid)
    return git_diff(winid, 'changed'),  ' 柳'
end

-- Utility function to check if git provider information is available
function M.git_info_exists(winid)
    local ok, _ = pcall(api.nvim_buf_get_var, api.nvim_win_get_buf(winid), 'gitsigns_status_dict')
    return ok
end

return M
