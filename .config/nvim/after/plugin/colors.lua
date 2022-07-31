local api = vim.api

vim.cmd("colorscheme nisha")
api.nvim_set_hl(0, "Normal", { bg = nil })
api.nvim_set_hl(0, "NonText", { bg = nil })
api.nvim_set_hl(0, "EndOfBuffer", { bg = nil, fg = "#3d3d3d" })
api.nvim_set_hl(0, "MatchParen", { fg = "#dedede", bold = true })
api.nvim_set_hl(0, "Pmenu", { bg = "#0F1115" })
api.nvim_set_hl(0, "PmenuSbar", { bg = nil })
api.nvim_set_hl(0, "PmenuThumb", { bg = nil })
api.nvim_set_hl(0, "LineNr", { bg = nil, fg = "#3e3e3e" })
api.nvim_set_hl(0, "CursorLineNr", { bg = nil, fg = "#707070", bold = true })
api.nvim_set_hl(0, "CursorLine", { bg = "#23262e" })

api.nvim_set_hl(0, "LspFloatWinNormal", { bg = "#0F1115" })

-- Diagnostics
api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ffc38d", bold = true })
api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff4d66", bold = true })
api.nvim_set_hl(0, "DiagnosticHint", { fg = "#99b7c2", bold = true })
api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#707070", bold = true })

-- Telescope
api.nvim_set_hl(0, "TelescopeBorder", { fg = "#3a3a3a" })
api.nvim_set_hl(0, "TelescopeTitle", { fg = "#808080" })
api.nvim_set_hl(0, "TelescopeSelection", { bg = "#23262e" })

-- Cmp
api.nvim_set_hl(0, "CmpItemKindText", { fg = "#99b7c2" })
api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#dd816a" })
api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#e8c19b" })
api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#a27fc2" })
api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#a27fc2" })
api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#a27fc2" })
api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#a27fc2" })
api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#6bc29a" })
api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#ff4d66" })
api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#8dc2e3" })
api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#ea93c2" })
api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#ea93c2" })
api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#cb697a" })

-- Synatx
api.nvim_set_hl(0, "Comment", { fg = "#808080", italic = true })
api.nvim_set_hl(0, "Boolean", { fg = "#a27fc2", italic = true })
