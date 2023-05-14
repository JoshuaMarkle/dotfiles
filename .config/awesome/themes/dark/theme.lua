---------------------------------------------
-- Awesome theme using Catppuccin mocha    --
---------------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"

local theme = {}

theme.icons_awesome = "a"
theme.icons_layout = "l"
theme.icons_terminal = "t"
theme.icons_browsere = "b"
theme.icons_file = "f"

theme.font = "Fira Code 10"
theme.useless_gap = 10
theme.border_width = 2

theme.background = "#1E1E2E"
theme.crust = "#11111b"
theme.text = "#cdd6f4"
theme.subtext0 = "#a6adc8"
theme.subtext1 = "#bac2de"

theme.surface0 = "#313244"
theme.surface1 = "#45475a"
theme.surface2 = "#585b70"

theme.overlay0 = "#6c7086"
theme.overlay1 = "#7f849c"
theme.overlay2 = "#9399b2"

theme.blue = "#89b4fa"
theme.lavender = "#b4befe"
theme.sapphire = "#74c7ec"
theme.sky = "#89dceb"
theme.teal = "#94e2d5"
theme.green = "#a6e3a1"
theme.yellow = "#f9e2af"
theme.peach = "#fab387"
theme.maroon = "#eba0ac"
theme.red = "#f38ba8"
theme.mauve = "#cba6f7"
theme.pink = "#f5c2e7"
theme.flamingo = "#f2cdcd"
theme.rosewater = "#f5e0dc"


theme.bg_normal = theme.background
theme.bg_focus = theme.crust
theme.bg_urgent = theme.red
theme.bg_minimize = theme.surface1
theme.bg_systray = theme.background

theme.fg_normal = theme.text
theme.fg_focus = theme.blue
theme.fg_urgent = theme.red
theme.fg_minimize = theme.pink

theme.border_normal = theme.surface0
theme.border_focus = theme.surface2
theme.border_marked = theme.mauve

-- Generate taglist squares:
local taglist_square_size = dpi(10)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)
theme.taglist_disable_icon = true

-- Variables set for theming notifications:
theme.notification_font = "Fira Code 10"
theme.notification_margin = dpi(10)
theme.notification_border_color = theme.border_normal
theme.notification_border_width = theme.border_width
theme.notification_icon_size = dpi(60)

-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.menu_submenu_icon = ">"
theme.menu_height = 18
theme.menu_width = 140

return theme
