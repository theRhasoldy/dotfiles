local create_autocmd = vim.api.nvim_create_autocmd
local create_group = vim.api.nvim_create_augroup

-- Auto reload files to detect changes
local AutoReload = create_group("AutoReload", { clear = true })
create_autocmd({ "FocusGained", "BufEnter" }, {
  group = AutoReload,
  command = ":checktime",
})

-- Format Options
local FormatOptions = create_group("FormatOptions", { clear = true })
create_autocmd("BufEnter", {
  group = FormatOptions,
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- Telescope on startup
--[[ local HarpoonStartup = create_group("HarpoonStartup", { clear = true })
create_autocmd("UIEnter", {
  group = HarpoonStartup,
  callback = function()
    require("telescope").extensions.harpoon.marks({
      initial_mode = "normal",
    })
  end,
}) ]]

-- Lazy load clipboard
local LoadClipboard = create_group("LoadClipboard", { clear = true })
create_autocmd("BufEnter", {
  group = LoadClipboard,
  callback = function()
    vim.opt.clipboard = "unnamedplus"
  end,
})

local getCursor = vim.api.nvim_win_get_cursor

function StayCentered(inInsert)
  local line = getCursor(0)[1]

  if line ~= vim.b.last_line then
    vim.cmd("norm! zz")

    vim.b.last_line = line
    if inInsert then
      local column = vim.fn.getcurpos()[5]
      vim.fn.cursor(line, column)
    end
  end
end

local Centered = create_group("StayCentered", { clear = true })
create_autocmd("CursorMovedI", {
  group = Centered,
  callback = function()
    StayCentered(true)
  end,
})
create_autocmd("CursorMoved", {
  group = Centered,
  callback = function()
    StayCentered(false)
  end,
})
