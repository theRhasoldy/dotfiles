local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	return
end

require("options")
require("keybinds")

impatient.enable_profile()
require("plugins")
