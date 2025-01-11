-- custom_config.lua file to provide custom configuration for LususNvim

local utils = require("config.utils")

local M = {}

-- options put here will override or add on to the default options
M.options = {
  opt = {
    confirm = true,
    number = true,
    relativenumber = true,
    tabstop = 8,
    softtabstop = 8,
    shiftwidth = 8,
    expandtab = false,
    hlsearch = false,
    incsearch = true,
    updatetime = 50,
    colorcolumn = "100",
    showmode = false,
    signcolumn = "yes",
    numberwidth = 6,
    guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
    cursorline = true,
    cursorlineopt = "number",
    linebreak = true,
    showbreak = "=>>",
    textwidth = 100,
    breakindent = true,
    breakindentopt = "shift:2,min:40,sbr",
    smartcase = true,
    ignorecase = true,
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldlevel = 99,
    foldlevelstart = 99,
    foldopen = "jump,block,hor,mark,percent,quickfix,search,tag,undo",
    foldenable = true,
    clipboard = "unnamedplus",
    scrolloff = 5,
    autowrite = true,
    autochdir = true,
    termguicolors = true,
    undofile = true,
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
    hidden = true,
    laststatus = 3,
  },
}

-- add any null-ls sources you want here
M.setup_sources = function(b)
  return {
    b.completion.luasnip,
    b.completion.tags,
    b.formatting.clang_format,
    b.formatting.stylua,
    b.formatting.cbfmt,
    b.formatting.shfmt,
    b.formatting.gofumpt,
    b.formatting.goimports_reviser,
    b.formatting.black,
    b.formatting.prettierd.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
      },
    }),
    b.formatting.cmake_format,
    b.diagnostics.checkmake,
    b.diagnostics.pylint,
    b.diagnostics.revive,
    b.diagnostics.cmake_lint,
    b.code_actions.gitrebase,
    b.code_actions.gitsigns,
    b.code_actions.gomodifytags,
    b.code_actions.refactoring,
    b.hover.dictionary,
  }
end

-- add mason sources to auto-install
M.mason_ensure_installed = {
  null_ls = {
    "stylua",
    "lua-language-server",
    "clangd",
    "clang-format",
    "codelldb",
    "basedpyright",
    "black",
    "pylint",
    "rust-analyzer",
    "gopls",
    "gofumpt",
    "goimports-reviser",
    "gomodifytags",
    "revive",
    "prettierd",
    "typescript-language-server",
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "autotools-language-server",
    "checkmake",
    "mesonlsp",
    "shfmt",
    -- "ruby-lsp",
    -- "rubyfmt",
  },
  dap = {
    "python",
  },
}

-- add servers to be used for auto formatting here
M.formatting_servers = {
  ["null_ls"] = {
    "lua",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html",
    "css",
    "json",
    "sh",
    "bash",
    "zsh",
    "c",
    "cpp",
    "objc",
    "objcpp",
    "cuda",
    "proto",
    "python",
    "rust",
    "go",
    "meson",
    "cmake",
    "markdown",
    -- "ruby",
  },
}

-- Set any to false that you want disabled in here.
-- take a look at the autocommands file in lua/core for more information
-- Default value is true if left blank
M.autocommands = {
  alpha_folding = true,
  treesitter_folds = true,
  trailing_whitespace = true,
  remember_file_state = true,
  session_saved_notification = true,
  css_colorizer = true,
  cmp = true,
}

-- set to false to disable plugins
-- Default value is true if left blank
M.enable_plugins = {
  aerial = true,
  alpha = true,
  autotag = true,
  bufferline = true,
  context = true,
  copilot = true,
  dressing = true,
  gitsigns = true,
  hop = true,
  img_clip = true,
  indent_blankline = true,
  lsp_zero = true,
  neodev = true,
  neoscroll = true,
  neotree = true,
  session_manager = true,
  noice = true,
  null_ls = true,
  autopairs = true,
  cmp = true,
  colorizer = true,
  dap = true,
  notify = true,
  surround = true,
  treesitter = true,
  ufo = true,
  onedark = true,
  project = true,
  rainbow = true,
  scope = true,
  telescope = true,
  toggleterm = true,
  trouble = true,
  twilight = true,
  whichkey = true,
  windline = true,
  zen = true,
}

-- add extra plugins in here
M.plugins = {
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    cond = M.enable_plugins.rust_tools,
    config = function()
      require("custom.plugin-configs.rust-tools")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    cond = M.enable_plugins.tokyonight,
    config = function()
      require("custom.plugin-configs.tokyonight")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    cond = M.enable_plugins.catppuccin,
    config = function()
      require("custom.plugin-configs.catppuccin")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    cond = M.enable_plugins.nightfox,
    config = function()
      require("custom.plugin-configs.nightfox")
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    cond = M.enable_plugins.monokai_pro,
    config = function()
      require("custom.plugin-configs.monokai-pro")
    end,
  },
}

M.lsp_configs = {
  clangd = {
    capabilities = {
      offsetEncoding = { "utf-8", "utf-16" },
      textDocument = {
        completion = {
          editsNearCursor = true,
        },
      },
    },
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  },
  lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
      Lua = {
        diagnostics = {
          disable = { "missing-fields" },
          globals = { "vim" }, -- CyberNvim didn't configure this so lua_ls would warn about it
        },
        hint = {
          enable = true,
        },
      },
    },
    log_level = 2,
  },
  basedpyright = {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  taplo = {
    cmd = { "taplo", "lsp", "stdio" },
    filetypes = { "toml" },
  },
  -- ruby_lsp = {
  -- 	cmd = { "ruby-lsp" },
  -- 	filetypes = { "ruby", "eruby" },
  -- 	init_options = { "auto" },
  -- },
}

-- add extra configuration options here, like extra autocmds etc.
-- feel free to create your own separate files and require them in here
M.custom_conf = function()
  -- greeting upon startup
  utils.notify_info("Here be dragons! Fear is the mind killer.", "<==> Lusus Naturae <==>")

  -- set color scheme
  -- utils.colorscheme("catppuccin")
  -- utils.colorscheme("tokyonight")
  -- utils.colorscheme("nightfox")
  -- utils.colorscheme("astrotheme")
  -- utils.colorscheme("astromars")
  -- utils.colorscheme("monokai-pro-machine")
  -- utils.colorscheme("monokai-pro-octagon")

  -- windline statusbar
  -- require("wlsample.evil_line")
  -- require("wlsample.airline")
end

return M
