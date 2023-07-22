local symbols = {
  Text = "󰚞",
  Method = "󰆩",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "󱉸",
  Value = "󱢏",
  Enum = "",
  Keyword = "",
  Snippet = "󰆐",
  Color = "󰌁",
  File = "󰈔",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "󱌣",
  TypeParameter = "󰉺",
}

return {
  {
    "glepnir/lspsaga.nvim",
    name = "lspsaga",
    event = "BufRead",
    opts = {
      finder = {
        min_width = 60,
        keys = {
          expand_or_jump = "<CR>",
          jump_to = "<S-CR>",
        },
      },
      code_action = {
        extend_gitsigns = true,
        show_server_name = true,
      },
      hover = { max_width = 0.6, open_link = "gf", open_browser = "!chrome" },
      diagnostic = {
        keys = {
          quit = { "q", "<Esc>" },
        },
      },
      lightbulb = {
        virtual_text = false,
        sign = true,
      },
      symbol_in_winbar = {
        enable = false,
      },
      rename = {
        quit = "q",
      },
      ui = {
        border = "single",
        winblend = 10,
        code_action = " ",
        diagnostic = " ",
        hover = "󰑣 ",
      },
      kind = symbols,
    },
    keys = {
      {
        "<Leader><Leader>",
        "<cmd>Lspsaga show_line_diagnostics<CR>",
        { noremap = true },
      },
      {
        "gr",
        "<cmd>Lspsaga rename<CR>",
      },
      {
        "ga",
        "<cmd>Lspsaga code_action<CR>",
      },
      {
        "gd",
        "<cmd>Lspsaga hover_doc ++quiet<CR>",
      },
      {
        "gD",
        "<cmd>Lspsaga lsp_finder<CR>",
      },
      {
        "gtd",
        "<cmd>Lspsaga goto_definition<CR>",
      },
    },
    config = function(_, opts)
      local present, saga = pcall(require, "lspsaga")
      if not present then
        return
      end
      saga.setup(opts)
    end,
  },
  {
    "onsails/lspkind.nvim",
    name = "lspkind",
    event = "BufReadPre",
    config = function()
      local present, kind = pcall(require, "lspkind")
      if not present then
        return
      end
      kind.init({
        mode = "symbol",
        preset = "codicons",
        symbol_map = symbols,
      })
    end,
  },
}
