vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-moon")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
      { "<leader>f", "<cmd>NvimTreeFindFile<CR>", desc = "Find file in tree" },
    },
    config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>g", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>h", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {},
  },
})

-- Editor options
vim.opt.number = true
vim.opt.clipboard = "unnamed"
vim.opt.termguicolors = true
vim.opt.updatetime = 300

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.showmatch = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.smarttab = true

-- File handling
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.autoread = true

-- Display
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.title = true
vim.opt.visualbell = true
vim.opt.errorbells = false

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 10
vim.opt.foldenable = false

-- Wildmenu
vim.opt.wildmode = "list:longest,full"
vim.opt.wildignore = "*.swp,*.bak,*.pyc,*.class,.cabal-sandbox"

-- History
vim.opt.history = 1000
vim.opt.undolevels = 1000

-- Use ripgrep for :grep if available
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- Keymaps
vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<CR>", { silent = true })
vim.keymap.set("n", "<leader>sv", ":so $MYVIMRC<CR>", { silent = true })
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<CR>", function()
  if vim.bo.buftype == "quickfix" then
    return "<CR>"
  end
  return ":nohlsearch<CR><CR>"
end, { silent = true, expr = true })
vim.keymap.set("n", "<leader>s", ":%s/\\v<C-r><C-w>//g<Left><Left>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Split navigation
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- Insert blank lines without entering insert mode
vim.keymap.set("n", "<A-j>", "m`o<Esc>``", { silent = true })
vim.keymap.set("n", "<A-k>", "m`O<Esc>``", { silent = true })

-- Insert mode navigation
vim.keymap.set("i", "<C-e>", "<End>")
vim.keymap.set("i", "<C-a>", "<Home>")

-- Restore cursor position on file open
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Autosave on focus lost
vim.api.nvim_create_autocmd("FocusLost", {
  pattern = "*",
  command = "silent! wall",
})
