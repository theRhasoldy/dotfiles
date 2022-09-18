----------------------------------------------------------------------------
--- Wallpaper Blurring Script
--
-- @author William McKinnon
-- @module wallpaper
--
--- Enjoy!
----------------------------------------------------------------------------

--      ██╗    ██╗ █████╗ ██╗     ██╗     ██████╗  █████╗ ██████╗ ███████╗██████╗
--      ██║    ██║██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
--      ██║ █╗ ██║███████║██║     ██║     ██████╔╝███████║██████╔╝█████╗  ██████╔╝
--      ██║███╗██║██╔══██║██║     ██║     ██╔═══╝ ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
--      ╚███╔███╔╝██║  ██║███████╗███████╗██║     ██║  ██║██║     ███████╗██║  ██║
--       ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝

-- ===================================================================
-- Imports
-- ===================================================================

local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local config_dir = gears.filesystem.get_configuration_dir()

-- ===================================================================
-- Initialization
-- ===================================================================

local blurred = false

local wallpaper = "/usr/share/backgrounds/cityscapes.png"
local blurredWallpaper = config_dir .. "/blurredWallpaper.png"

-- Set initial wallpaper
awful.spawn.with_shell("feh --no-fehbg --bg-fill " .. wallpaper)

--- Check if a file or directory exists in this path
local function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

-- check if blurred wallpaper needs to be created
if not exists(blurredWallpaper) then
	naughty.notify({
		preset = naughty.config.presets.normal,
		title = "Wallpaper",
		text = "Generating blurred wallpaper...",
	})
	-- uses image magick to create a blurred version of the wallpaper
	awful.spawn.with_shell("convert -filter Gaussian -blur 0x20 " .. wallpaper .. " " .. blurredWallpaper)
end

-- ===================================================================
-- Functionality
-- ===================================================================

-- changes to blurred wallpaper
function blur()
	if not blurred then
		awful.spawn.with_shell("feh --no-fehbg --bg-fill " .. blurredWallpaper)
		blurred = true
	end
end

-- changes to normal wallpaper
function unblur()
	if blurred then
		awful.spawn.with_shell("feh --no-fehbg --bg-fill " .. wallpaper)
		blurred = false
	end
end

-- blur / unblur on tag change
tag.connect_signal("property::selected", function(t)
	-- if tag has clients
	for _ in pairs(t:clients()) do
		blur()
		return
	end
	-- if tag has no clients
	unblur()
end)

-- check if wallpaper should be blurred on client open
client.connect_signal("request::activate", function(c)
	blur()
end)

client.connect_signal("focus", function(c)
	local t = awful.screen.focused().selected_tag
	-- check if any open clients
	for _ in pairs(t:clients()) do
		blur()
		return
	end
	-- unblur if no open clients
	unblur()
end)

client.connect_signal("unfocus", function(c)
	local t = awful.screen.focused().selected_tag
	if t ~= nil then
		for _ in pairs(t:clients()) do
			return
		end
	else
		return
	end
	-- unblur if no open clients
	unblur()
end)

client.connect_signal("unmanage", function(c)
	local t = awful.screen.focused().selected_tag
	-- check if any open clients
	for _ in pairs(t:clients()) do
		return
	end
	-- unblur if no open clients
	unblur()
end)
