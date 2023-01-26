local ac = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup
local getCursor = vim.api.nvim_win_get_cursor
local skip_files = vim.g["stay-centered#skip_filetypes"]

local function config_has_files_to_skip(t, v)
  if t ~= nil then
    for value in ipairs(t) do
      if value == v then
        return true
      end
    end
  end
end

function StayCentered(inInsert)
  if config_has_files_to_skip(skip_files, vim.bo.filetype) then
    return false
  end

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

local group = ag("StayCentered", { clear = true })
ac("CursorMovedI", {
  group = group,
  callback = function()
    StayCentered(true)
  end,
})

ac("CursorMoved", {
  group = group,
  callback = function()
    StayCentered(false)
  end,
})

-- Show cursor line only on current buffer
--[[ local cursor_group = ag("CursorLine", { clear = true })
ac("BufEnter", {
	group = cursor_group,
	callback = function()
		vim.opt.cursorline = true
	end,
})
ac("BufLeave", {
	group = cursor_group,
	callback = function()
		vim.opt.cursorline = false
	end,
})
ac("WinEnter", {
	group = cursor_group,
	callback = function()
		vim.opt.cursorline = true
	end,
})
ac("WinLeave", {
	group = cursor_group,
	callback = function()
		vim.opt.cursorline = false
	end,
}) ]]
