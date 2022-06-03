client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

-- buttons for the titlebar
local buttons = gears.table.join(
    awful.button({ }, 1, function()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end)
)

awful.titlebar(c, {size = 24, position = 'top'}) : setup {
	{
		{
			awful.titlebar.widget.closebutton(c),
			awful.titlebar.widget.minimizebutton (c),
			layout  = wibox.layout.fixed.horizontal,
			spacing = dpi(10),
   		widget = wibox.container.margin,
		},
		margins = dpi(2),
		widget = wibox.container.margin,
	},
	{
		buttons = buttons,
		layout = wibox.layout.flex.horizontal
	},
 	{
			awful.titlebar.widget.floatingbutton (c),
			awful.titlebar.widget.stickybutton (c),
			spacing = dpi(8),
			layout  = wibox.layout.fixed.horizontal
	},
	layout = wibox.layout.align.horizontal
}

end)
