local status, colorpicker = pcall(require, "color-picker")
if not status then
	return
end

colorpicker.setup()
