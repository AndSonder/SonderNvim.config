vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.loader.enable()

-- General behavior
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.showmode = false
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.wrap = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.laststatus = 3
vim.o.completeopt = "menuone,noselect"
vim.o.cmdheight = 1
vim.o.pumheight = 12
vim.o.list = true
vim.o.listchars = "tab:┆ ,trail:·,nbsp:·"
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

-- Theme (fallback)
vim.o.background = "dark"

local function apply_ghostty_default_style_dark()
  local c = {
    bg = "#282c34",
    fg = "#ffffff",
    cursor = "#ffffff",
    cursor_text = "#353a44",
    selection_bg = "#ffffff",
    selection_fg = "#282c34",
    black = "#1d1f21",
    red = "#cc6566",
    green = "#b6bd68",
    yellow = "#f0c674",
    blue = "#82a2be",
    magenta = "#b294bb",
    cyan = "#8abeb7",
    white = "#c4c8c6",
    br_black = "#666666",
    br_red = "#d54e53",
    br_green = "#b9ca4b",
    br_yellow = "#e7c547",
    br_blue = "#7aa6da",
    br_magenta = "#c397d8",
    br_cyan = "#70c0b1",
    br_white = "#eaeaea",
    soft = "#353a44",
  }

  vim.g.terminal_color_0 = c.black
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.white
  vim.g.terminal_color_8 = c.br_black
  vim.g.terminal_color_9 = c.br_red
  vim.g.terminal_color_10 = c.br_green
  vim.g.terminal_color_11 = c.br_yellow
  vim.g.terminal_color_12 = c.br_blue
  vim.g.terminal_color_13 = c.br_magenta
  vim.g.terminal_color_14 = c.br_cyan
  vim.g.terminal_color_15 = c.br_white

  vim.g.colors_name = "ghostty_default_style_dark"
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")

  local set = vim.api.nvim_set_hl

  set(0, "Normal", { fg = c.fg, bg = c.bg })
  set(0, "NormalNC", { fg = c.fg, bg = c.bg })
  set(0, "NormalFloat", { fg = c.fg, bg = c.bg })
  set(0, "FloatBorder", { fg = c.fg, bg = c.bg })
  set(0, "FloatTitle", { fg = c.white, bg = c.bg, bold = true })
  set(0, "CursorLine", { bg = c.soft })
  set(0, "CursorLineNr", { fg = c.br_white, bg = c.soft, bold = true })
  set(0, "CursorColumn", { bg = c.soft })
  set(0, "LineNr", { fg = c.br_black })
  set(0, "SignColumn", { bg = c.bg })
  set(0, "Folded", { fg = c.white, bg = c.soft })
  set(0, "FoldColumn", { fg = c.br_black, bg = c.bg })
  set(0, "VertSplit", { fg = c.soft, bg = c.bg })
  set(0, "WinSeparator", { fg = c.soft, bg = c.bg })
  set(0, "ColorColumn", { bg = c.soft })
  set(0, "Visual", { fg = c.selection_fg, bg = c.selection_bg, reverse = true })
  set(0, "VisualNOS", { fg = c.selection_fg, bg = c.selection_bg, reverse = true })
  set(0, "Search", { fg = c.bg, bg = c.yellow, bold = true })
  set(0, "IncSearch", { fg = c.bg, bg = c.br_yellow, bold = true })
  set(0, "MatchParen", { fg = c.br_cyan, bold = true })
  set(0, "Pmenu", { fg = c.fg, bg = c.soft })
  set(0, "PmenuSel", { fg = c.bg, bg = c.br_white })
  set(0, "PmenuThumb", { fg = c.br_white, bg = c.br_white })
  set(0, "PmenuSbar", { bg = c.soft })
  set(0, "SpecialKey", { fg = c.br_black })
  set(0, "NonText", { fg = c.br_black })
  set(0, "EndOfBuffer", { fg = c.bg })
  set(0, "Title", { fg = c.br_white, bold = true })
  set(0, "Directory", { fg = c.blue })
  set(0, "Comment", { fg = c.br_black, italic = true })
  set(0, "Todo", { fg = c.br_red, bg = c.soft, bold = true })

  set(0, "StatusLine", { fg = c.fg, bg = c.soft })
  set(0, "StatusLineNC", { fg = c.br_black, bg = c.bg })
  set(0, "TabLine", { fg = c.br_black, bg = c.bg })
  set(0, "TabLineFill", { fg = c.soft, bg = c.bg })
  set(0, "TabLineSel", { fg = c.fg, bg = c.soft, bold = true })

  set(0, "DiagnosticError", { fg = c.red })
  set(0, "DiagnosticWarn", { fg = c.yellow })
  set(0, "DiagnosticInfo", { fg = c.blue })
  set(0, "DiagnosticHint", { fg = c.cyan })
  set(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
  set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
  set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
  set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })

  set(0, "DiffAdd", { fg = c.br_green, bg = c.soft })
  set(0, "DiffChange", { fg = c.br_blue, bg = c.soft })
  set(0, "DiffDelete", { fg = c.red, bg = c.soft })
  set(0, "DiffText", { fg = c.fg, bg = c.br_black })

  set(0, "GitSignsAdd", { fg = c.green })
  set(0, "GitSignsChange", { fg = c.blue })
  set(0, "GitSignsDelete", { fg = c.red })
  set(0, "GitSignsTopdelete", { fg = c.red })
  set(0, "GitSignsChangedelete", { fg = c.blue })
  set(0, "GitSignsUntracked", { fg = c.green })

  set(0, "Type", { fg = c.fg })
  set(0, "Identifier", { fg = c.fg })
  set(0, "Function", { fg = c.blue })
  set(0, "Keyword", { fg = c.magenta })
  set(0, "String", { fg = c.green })
  set(0, "Character", { fg = c.br_green })
  set(0, "Constant", { fg = c.yellow })
  set(0, "Number", { fg = c.red })
  set(0, "Boolean", { fg = c.red })
  set(0, "Statement", { fg = c.magenta, bold = true })
  set(0, "Conditional", { fg = c.cyan })
  set(0, "Repeat", { fg = c.cyan })
  set(0, "Operator", { fg = c.fg })
  set(0, "PreProc", { fg = c.blue })
  set(0, "Special", { fg = c.yellow })
  set(0, "Error", { fg = c.red })
  set(0, "Question", { fg = c.green, bold = true })
  set(0, "WarningMsg", { fg = c.yellow })
  set(0, "ErrorMsg", { fg = c.red })
  set(0, "ModeMsg", { fg = c.fg })
  set(0, "MatchWord", { underline = true })
  set(0, "WinBar", { fg = c.fg, bg = c.bg })
  set(0, "WinBarNC", { fg = c.br_black, bg = c.bg })
  set(0, "QuickFixLine", { fg = c.bg, bg = c.br_yellow, bold = true })
  set(0, "StatusLineTerm", { fg = c.fg, bg = c.soft })
  set(0, "StatusLineTermNC", { fg = c.br_black, bg = c.bg })

  set(0, "ScrollbarLine", { fg = c.br_white })
  set(0, "ScrollbarSearch", { fg = c.yellow })
  set(0, "ScrollbarError", { fg = c.red })
  set(0, "ScrollbarWarning", { fg = c.yellow })
  set(0, "ScrollbarInfo", { fg = c.cyan })
  set(0, "ScrollbarHandle", { fg = c.br_black, bg = c.br_black })
  set(0, "NvimTreeNormal", { fg = c.fg, bg = c.bg })
  set(0, "NvimTreeNormalNC", { fg = c.fg, bg = c.bg })
  set(0, "NvimTreeWinSeparator", { fg = c.soft, bg = c.bg })
  set(0, "NeoTreeNormal", { fg = c.fg, bg = c.bg })
  set(0, "NeoTreeNormalNC", { fg = c.fg, bg = c.bg })
  set(0, "NeoTreeWinSeparator", { fg = c.soft, bg = c.bg })
  set(0, "TelescopePromptBorder", { fg = c.fg, bg = c.bg })
  set(0, "TelescopeResultsTitle", { fg = c.bg, bg = c.white, bold = true })
  set(0, "TelescopeSelection", { fg = c.fg, bg = c.soft })
  set(0, "TelescopeSelectionCaret", { fg = c.green, bg = c.soft })
  set(0, "TelescopeMatching", { fg = c.yellow, bold = true })
  set(0, "CmpItemAbbr", { fg = c.fg })
  set(0, "CmpItemAbbrMatch", { fg = c.yellow, bold = true })
  set(0, "CmpItemAbbrDeprecated", { fg = c.br_black, strikethrough = true })
  set(0, "CmpItemAbbrMatchFuzzy", { fg = c.yellow, bold = true })
  set(0, "CmpItemKind", { fg = c.blue })
  set(0, "CmpItemMenu", { fg = c.br_black })
  set(0, "LspReferenceText", { bg = c.soft })
  set(0, "LspReferenceRead", { bg = c.soft })
  set(0, "LspReferenceWrite", { bg = c.soft })
  set(0, "LspInlayHint", { fg = c.br_black })

  local treesitter = {
    ["@comment"] = { fg = c.br_black, italic = true },
    ["@error"] = { fg = c.red },
    ["@punctuation"] = { fg = c.white },
    ["@punctuation.special"] = { fg = c.fg },
    ["@constant"] = { fg = c.yellow },
    ["@constant.builtin"] = { fg = c.yellow },
    ["@constant.macro"] = { fg = c.yellow },
    ["@string"] = { fg = c.green },
    ["@string.escape"] = { fg = c.br_green },
    ["@string.special"] = { fg = c.br_green },
    ["@character"] = { fg = c.br_green },
    ["@character.special"] = { fg = c.br_green },
    ["@number"] = { fg = c.red },
    ["@float"] = { fg = c.red },
    ["@boolean"] = { fg = c.red },
    ["@identifier"] = { fg = c.fg },
    ["@function"] = { fg = c.blue },
    ["@function.builtin"] = { fg = c.blue },
    ["@function.call"] = { fg = c.blue },
    ["@function.macro"] = { fg = c.blue },
    ["@constructor"] = { fg = c.blue },
    ["@method"] = { fg = c.blue },
    ["@keyword"] = { fg = c.magenta },
    ["@keyword.function"] = { fg = c.magenta },
    ["@keyword.operator"] = { fg = c.magenta },
    ["@type"] = { fg = c.fg },
    ["@type.builtin"] = { fg = c.fg },
    ["@type.qualifier"] = { fg = c.magenta },
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.fg },
    ["@property"] = { fg = c.cyan },
    ["@field"] = { fg = c.cyan },
    ["@parameter"] = { fg = c.fg },
    ["@namespace"] = { fg = c.fg },
    ["@symbol"] = { fg = c.fg },
    ["@preproc"] = { fg = c.blue },
    ["@include"] = { fg = c.magenta },
    ["@conditional"] = { fg = c.cyan },
    ["@repeat"] = { fg = c.cyan },
    ["@operator"] = { fg = c.fg },
    ["@exception"] = { fg = c.magenta },
    ["@label"] = { fg = c.magenta },
    ["@special"] = { fg = c.yellow },
  }
  for group, opts in pairs(treesitter) do
    set(0, group, opts)
  end
end

apply_ghostty_default_style_dark()

-- Leader shortcuts
local map = vim.keymap.set
map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save" })
map("n", "<leader>W", "<Cmd>wa<CR>", { desc = "Save all" })
map("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<Cmd>qa<CR>", { desc = "Quit all" })
map("n", "<leader>h", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
local function toggle_cmd_p_finder()
  local function is_telescope_prompt_window(win)
    local buf = vim.api.nvim_win_get_buf(win)
    return vim.api.nvim_get_option_value("filetype", { buf = buf }) == "TelescopePrompt"
  end

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win) and is_telescope_prompt_window(win) then
      pcall(vim.api.nvim_win_close, win, true)
      return
    end
  end

  require("telescope.builtin").find_files()
end

map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find files" })
map({ "n", "i" }, "<D-p>", toggle_cmd_p_finder, { desc = "Toggle file finder (cmd+p)" })
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>gq", "<Cmd>DiffviewOpen<CR>", { desc = "Git diff: open" })
map("n", "<leader>gD", "<Cmd>Gitsigns diffthis<CR>", { desc = "Git diff: current file vs HEAD" })
map("n", "<leader>gx", "<Cmd>DiffviewClose<CR>", { desc = "Git diff: close" })
map("n", "<leader>gH", "<Cmd>DiffviewFileHistory %<CR>", { desc = "Git diff: file history (current file)" })
local function neotree_git_repo_root()
  return vim.fs.root(0, ".git")
end

local function neotree_exec(opts)
  local ok, err = pcall(function()
    require("neo-tree.command").execute(opts)
  end)
  if not ok then
    vim.notify(("Neotree exec failed: %s"):format(err), vim.log.levels.ERROR, { title = "Neotree" })
  end
  return ok
end

local function neotree_git_status_in_dir(root_dir)
  local ok, output = pcall(vim.fn.systemlist, { "git", "-C", root_dir, "status", "--short" })
  if ok and output and #output == 0 then
    vim.notify(("Git status is clean in %s"):format(root_dir), vim.log.levels.INFO, { title = "Neotree git_status" })
  end

  neotree_exec({
    action = "show",
    source = "git_status",
    position = "right",
    dir = root_dir,
    reveal = false,
    toggle = false,
  })
end

local function neotree_git_status()
  local root = neotree_git_repo_root()
  if not root then
    vim.notify("Not inside a git repo", vim.log.levels.WARN, { title = "Neotree git_status" })
    return
  end
  neotree_git_status_in_dir(root)
end

local function neotree_git_repos_under_cwd()
  local cwd = vim.loop.cwd()
  if not cwd then
    return
  end

  local matches = vim.fn.globpath(cwd, "**/.git", false, true)
  if matches == "" then
    vim.notify("No .git folders found under current directory", vim.log.levels.WARN, { title = "Neotree git_status" })
    return
  end

  local repos = {}
  local seen = {}
  for _, path in ipairs(vim.split(matches, "\n")) do
    if path and path ~= "" and not path:find("/%.git/modules/") then
      local root = vim.fn.fnamemodify(path, ":h")
      if not seen[root] then
        seen[root] = true
        table.insert(repos, root)
      end
    end
  end

  if #repos == 0 then
    vim.notify("No git repo roots found", vim.log.levels.WARN, { title = "Neotree git_status" })
    return
  end

  table.sort(repos)
  vim.ui.select(repos, {
    prompt = "Select git repo",
    format_item = function(item) return item end,
  }, function(choice)
    if choice then
      neotree_git_status_in_dir(choice)
    end
  end)
end

local function neotree_filesystem_repo_root()
  local root = neotree_git_repo_root() or vim.fn.expand("%:p:h")
  if root == "" then
    root = vim.fn.getcwd()
  end
  neotree_exec({
    action = "show",
    source = "filesystem",
    position = "left",
    dir = root,
    reveal = true,
    toggle = false,
  })
end

local function neotree_source_control_layout()
  local root = neotree_git_repo_root()
  if not root then
    vim.notify("Not inside a git repo", vim.log.levels.WARN, { title = "Neotree Source Control" })
    return
  end
  neotree_exec({
    action = "show",
    source = "filesystem",
    position = "left",
    dir = root,
    reveal = true,
    toggle = false,
  })
  neotree_exec({
    action = "show",
    source = "git_status",
    position = "right",
    dir = root,
    reveal = true,
    toggle = false,
  })
end

local function neotree_close_source_control_layout()
  neotree_exec({ action = "close", source = "filesystem", position = "left" })
  neotree_exec({ action = "close", source = "git_status", position = "right" })
end

map("n", "<leader>gg", "<Cmd>Neogit kind=tab<CR>", { desc = "Source control: Neogit status" })
map("n", "<leader>gs", neotree_git_status, { desc = "Source control: git status tree (changed files)" })
map("n", "<leader>gR", neotree_git_repos_under_cwd, { desc = "Source control: pick git repo and show status" })
map("n", "<leader>gv", neotree_filesystem_repo_root, { desc = "Project file tree at git root (with git marks)" })
map("n", "<leader>gS", neotree_source_control_layout, { desc = "Source control: open file tree + git status panel" })
map("n", "<leader>gC", neotree_close_source_control_layout, { desc = "Source control: close SCM layout" })
map("n", "<leader>gF", function()
  local file = vim.fn.expand("%:p")
  if file == "" or vim.bo.buftype ~= "" then
    vim.notify("No normal file buffer selected", vim.log.levels.WARN, { title = "Git diff" })
    return
  end
  vim.cmd(("DiffviewOpen HEAD -- %s"):format(vim.fn.fnameescape(file)))
end, { desc = "Git diff: open current file vs HEAD" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Diagnostic float" })
map("n", "<leader>df", vim.lsp.buf.format, { desc = "Format" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })
map("n", "[g", function()
  require("gitsigns").nav_hunk("prev")
end, { desc = "Git: previous hunk" })
map("n", "]g", function()
  require("gitsigns").nav_hunk("next")
end, { desc = "Git: next hunk" })
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Git: preview hunk" })
map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "Git: diff current buffer" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function on_attach(_, bufnr)
  local bmap = function(lhs, rhs, desc)
    map("n", lhs, rhs, { buffer = bufnr, desc = desc, noremap = true, silent = true })
  end
  bmap("gd", vim.lsp.buf.definition, "LSP definition")
  bmap("gD", vim.lsp.buf.declaration, "LSP declaration")
  bmap("gr", vim.lsp.buf.references, "LSP references")
  bmap("gi", vim.lsp.buf.implementation, "LSP implementation")
  bmap("K", vim.lsp.buf.hover, "LSP hover")
  bmap("<leader>rr", vim.lsp.buf.rename, "LSP rename")
  bmap("<leader>ac", vim.lsp.buf.code_action, "LSP code action")
  bmap("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format file")
  bmap("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
  bmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
end

require("lazy").setup({
  spec = {
    { "nvim-tree/nvim-web-devicons" },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      cmd = { "Neotree" },
      opts = {
        sources = { "filesystem", "buffers", "git_status" },
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        source_selector = {
          winbar = true,
          statusline = false,
        },
        default_component_configs = {
          indent = { with_expanders = false },
        },
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_hidden = false,
          },
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["o"] = "open",
            },
          },
        },
      },
      keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
        { "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal current file in tree" },
        { "<leader>gs", "<cmd>lua require('neo-tree.command').execute({ action = 'toggle', source = 'git_status', position = 'left' })<cr>", desc = "Source control tree (changed files)" },
      },
    },
    {
      "nvim-lualine/lualine.nvim",
      opts = {
        options = {
          theme = {
            normal = {
              a = { fg = "#282c34", bg = "#eaeaea", gui = "bold" },
              b = { fg = "#ffffff", bg = "#353a44" },
              c = { fg = "#ffffff", bg = "#282c34" },
            },
            insert = {
              a = { fg = "#282c34", bg = "#82a2be", gui = "bold" },
              b = { fg = "#ffffff", bg = "#353a44" },
              c = { fg = "#ffffff", bg = "#282c34" },
            },
            visual = {
              a = { fg = "#282c34", bg = "#b294bb", gui = "bold" },
              b = { fg = "#ffffff", bg = "#353a44" },
              c = { fg = "#ffffff", bg = "#282c34" },
            },
            replace = {
              a = { fg = "#282c34", bg = "#cc6566", gui = "bold" },
              b = { fg = "#ffffff", bg = "#353a44" },
              c = { fg = "#ffffff", bg = "#282c34" },
            },
            command = {
              a = { fg = "#282c34", bg = "#f0c674", gui = "bold" },
              b = { fg = "#ffffff", bg = "#353a44" },
              c = { fg = "#ffffff", bg = "#282c34" },
            },
            inactive = {
              a = { fg = "#666666", bg = "#282c34" },
              b = { fg = "#666666", bg = "#282c34" },
              c = { fg = "#666666", bg = "#282c34" },
            },
          },
          section_separators = "",
          component_separators = "",
          globalstatus = true,
        },
      },
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { scope = { enabled = false } } },
    {
      "lewis6991/gitsigns.nvim",
      event = { "BufReadPre", "BufNewFile" },
      config = true,
      opts = {
        signcolumn = true,
        numhl = false,
        linehl = true,
        word_diff = true,
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 200,
          virt_text_pos = "eol",
          ignore_whitespace = true,
          virt_text = true,
        },
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "󰍵" },
          topdelete = { text = "󰍵" },
          changedelete = { text = "󰍵" },
          untracked = { text = "┆" },
        },
      },
    },
    {
      "petertriho/nvim-scrollbar",
      event = { "BufReadPost", "BufWritePost", "TextChanged", "TextChangedI" },
      config = function()
        local ok = pcall(require, "scrollbar")
        if ok then
          require("scrollbar").setup({
            show = true,
            show_in_active_only = false,
            handle = { text = " ", color = "#353a44" },
            marks = {
              GitAdd = { text = "│", color = "#b6bd68" },
              GitChange = { text = "│", color = "#82a2be" },
              GitDelete = { text = "│", color = "#cc6566" },
            },
          })
          pcall(require("scrollbar.handlers.gitsigns").setup)
        else
          vim.notify("scrollbar unavailable", vim.log.levels.WARN, { title = "nvim-scrollbar" })
        end
      end,
    },
    {
      "sindrets/diffview.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
      config = true,
    },
    {
      "NeogitOrg/neogit",
      cmd = "Neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "sindrets/diffview.nvim",
      },
      config = function()
        require("neogit").setup({
          integrations = {
            diffview = true,
            telescope = true,
          },
        })
      end,
    },
    { "numToStr/Comment.nvim", opts = {} },
    { "windwp/nvim-autopairs", opts = {} },

    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = { "Telescope" },
      opts = {
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "▎ ",
          layout_config = { width = 0.9, height = 0.85 },
        },
      },
    },

    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "bash", "cmake", "cpp", "json", "lua", "markdown", "python", "yaml", "vim", "vimdoc"
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
    },

    { "williamboman/mason.nvim", opts = {} },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = {
            "lua_ls", "pyright", "clangd", "ts_ls", "bashls", "jsonls", "yamlls", "cmake"
          },
          automatic_installation = false,
        })
      end,
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = { "hrsh7th/cmp-nvim-lsp" },
      config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        local servers = {
          lua_ls = {
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
              },
            },
          },
          pyright = {},
          clangd = {},
          ts_ls = {},
          bashls = {},
          jsonls = {},
          yamlls = {},
          cmake = {},
        }
        for server, cfg in pairs(servers) do
          cfg.on_attach = on_attach
          cfg.capabilities = capabilities
          lspconfig[server].setup(cfg)
        end
      end,
    },

    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          }),
        })
      end,
    },

    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "ruff_format", "black" },
          javascript = { "prettierd", "prettier" },
          typescript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          cpp = { "clang_format" },
          c = { "clang_format" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },
      },
    },
  },
  defaults = {
    lazy = true,
  },
  checker = { enabled = false },
  change_detection = {
    notify = false,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    apply_ghostty_default_style_dark()
  end,
})
