local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 12
config.color_scheme = "Catppuccin Macchiato"

config.audible_bell = "Disabled"

return config
