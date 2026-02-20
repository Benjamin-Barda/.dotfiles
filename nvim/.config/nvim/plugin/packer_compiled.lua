-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/benjamin/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/benjamin/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/benjamin/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/benjamin/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/benjamin/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["99"] = {
    config = { "\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vvisual+\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\22stop_all_requests \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vsearchL\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17select_model\02899.extensions.telescope\frequireO\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20select_provider\02899.extensions.telescope\frequireõ\4\1\0\b\0$\0B6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1B\1\1\0026\2\2\0009\2\5\0029\2\6\2\18\4\1\0B\2\2\0029\3\a\0005\5\t\0009\6\b\0=\6\n\0055\6\f\0009\a\v\0=\a\r\6=\6\14\0055\6\16\0005\a\15\0=\a\17\0064\a\0\0=\a\18\6=\6\19\0055\6\20\0=\6\21\5B\3\2\0016\3\2\0009\3\22\0039\3\23\3'\5\24\0'\6\25\0003\a\26\0B\3\4\0016\3\2\0009\3\22\0039\3\23\3'\5\24\0'\6\27\0003\a\28\0B\3\4\0016\3\2\0009\3\22\0039\3\23\3'\5\29\0'\6\30\0003\a\31\0B\3\4\0016\3\2\0009\3\22\0039\3\23\3'\5\29\0'\6 \0003\a!\0B\3\4\0016\3\2\0009\3\22\0039\3\23\3'\5\29\0'\6\"\0003\a#\0B\3\4\0012\0\0€K\0\1\0\0\15<leader>9p\0\15<leader>9m\0\15<leader>9s\6n\0\15<leader>9x\0\15<leader>9v\6v\bset\vkeymap\rmd_files\1\2\0\0\rAGENT.md\15completion\nfiles\17custom_rules\1\0\3\vsource\bcmp\17custom_rules\0\nfiles\0\1\2\0\0\26scratch/custom_rules/\vlogger\nlevel\1\0\3\19print_on_error\2\nlevel\0\tpath\15~/99.debug\nDEBUG\rprovider\1\0\4\rprovider\0\rmd_files\0\15completion\0\vlogger\0\21OpenCodeProvider\nsetup\rbasename\afs\bcwd\auv\bvim\a99\frequire\0" },
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/99",
    url = "https://github.com/ThePrimeagen/99"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  harpoon = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.nvim"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  moonfly = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/moonfly",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/benjamin/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: 99
time([[Config for 99]], true)
try_loadstring("\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vvisual+\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\22stop_all_requests \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\vsearchL\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17select_model\02899.extensions.telescope\frequireO\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20select_provider\02899.extensions.telescope\frequireõ\4\1\0\b\0$\0B6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1B\1\1\0026\2\2\0009\2\5\0029\2\6\2\18\4\1\0B\2\2\0029\3\a\0005\5\t\0009\6\b\0=\6\n\0055\6\f\0009\a\v\0=\a\r\6=\6\14\0055\6\16\0005\a\15\0=\a\17\0064\a\0\0=\a\18\6=\6\19\0055\6\20\0=\6\21\5B\3\2\0016\3\2\0009\3\22\0039\3\23\3'\5\24\0'\6\25\0003\a\26\0B\3\4\0016\3\2\0009\3\22\0039\3\23\3'\5\24\0'\6\27\0003\a\28\0B\3\4\0016\3\2\0009\3\22\0039\3\23\3'\5\29\0'\6\30\0003\a\31\0B\3\4\0016\3\2\0009\3\22\0039\3\23\3'\5\29\0'\6 \0003\a!\0B\3\4\0016\3\2\0009\3\22\0039\3\23\3'\5\29\0'\6\"\0003\a#\0B\3\4\0012\0\0€K\0\1\0\0\15<leader>9p\0\15<leader>9m\0\15<leader>9s\6n\0\15<leader>9x\0\15<leader>9v\6v\bset\vkeymap\rmd_files\1\2\0\0\rAGENT.md\15completion\nfiles\17custom_rules\1\0\3\vsource\bcmp\17custom_rules\0\nfiles\0\1\2\0\0\26scratch/custom_rules/\vlogger\nlevel\1\0\3\19print_on_error\2\nlevel\0\tpath\15~/99.debug\nDEBUG\rprovider\1\0\4\rprovider\0\rmd_files\0\15completion\0\vlogger\0\21OpenCodeProvider\nsetup\rbasename\afs\bcwd\auv\bvim\a99\frequire\0", "config", "99")
time([[Config for 99]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
