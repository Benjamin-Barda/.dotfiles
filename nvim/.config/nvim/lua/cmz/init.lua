local uv = vim.loop

-- Path to temporary directory
local temp_dir = "/tmp/cmz_temp_save/"

-- Ensure the temporary directory exists
local function ensure_temp_dir_exists()
    uv.fs_mkdir(temp_dir, 511, function(err)
        if err and err:match("exists") then
            return
        elseif err then
            error("Failed to create temp directory: " .. err)
        end
    end)
end


-- Save the buffer content to a temporary file
local function save_temp_file(bufnr)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
    local temp_filename = temp_dir .. bufnr .. "_" .. filename
    local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local file = io.open(temp_filename, "w")
    for _, line in ipairs(content) do
        file:write(line .. "\n")
    end
    file:close()
    vim.api.nvim_buf_set_var(bufnr, "temp_filename", temp_filename)
end

-- Print the diff on buffer save
local function print_diff(bufnr)
    local temp_filename = vim.api.nvim_buf_get_var(bufnr, "temp_filename")
    local new_content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local new_filename = temp_dir .. "new_" .. bufnr .. ".tmp"
    local file = io.open(new_filename, "w")
    for _, line in ipairs(new_content) do
        file:write(line .. "\n")
    end
    file:close()

    local diff_cmd = "diff -e " .. temp_filename .. " " .. new_filename
    local handle = io.popen(diff_cmd)
    local result = handle:read("*a")
    handle:close()

    -- Print the diff result
    print(result)

    -- Clean up the new temporary file
    os.remove(new_filename)
end

-- Delete the temporary file on buffer close
local function delete_temp_file(bufnr)
    local temp_filename = vim.api.nvim_buf_get_var(bufnr, "temp_filename")
    os.remove(temp_filename)
end

-- Autocommands
local function setup_autocommands()
    vim.api.nvim_command('augroup cmz')
    vim.api.nvim_command('autocmd!')
    vim.api.nvim_command('autocmd BufReadPost * lua require("cmz").save_temp_file(vim.fn.bufnr())')
    vim.api.nvim_command('autocmd BufWritePost * lua require("cmz").print_diff(vim.fn.bufnr())')
    vim.api.nvim_command('autocmd BufDelete * lua require("cmz").delete_temp_file(vim.fn.bufnr())')
    vim.api.nvim_command('augroup END')
end

local M = {}

function M.setup()
    ensure_temp_dir_exists()
    setup_autocommands()
end

function M.save_temp_file(bufnr)
    save_temp_file(bufnr)
end

function M.print_diff(bufnr)
    print_diff(bufnr)
    save_temp_file(bufnr)
end

function M.delete_temp_file(bufnr)
    delete_temp_file(bufnr)
end

return M

