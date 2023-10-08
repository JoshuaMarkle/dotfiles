------------------------------------
-- Awesome theme using Neovim ayu	--
------------------------------------

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

theme.font = "CaskaydiaCoveNerdFont 10"
theme.useless_gap = 15
theme.border_width = 0
theme.border_radius = 8

theme.background = "#0a0e14"
theme.crust = "#303742"
theme.text = "#b3b1ad"
theme.subtext0 = "#01060e"

theme.blue = "#55aaff"
theme.lavender = "#a29bfe"
theme.cyan = "#00cef1"
theme.green = "#23d18b"
theme.yellow = "#ffff8b"
theme.peach = "#ffb347"
theme.red = "#ff5768"

theme.bg_normal = theme.background
theme.bg_focus = theme.crust
theme.bg_urgent = theme.red
theme.bg_minimize = theme.crust
theme.bg_systray = theme.background

theme.fg_normal = theme.text
theme.fg_focus = theme.blue
theme.fg_urgent = theme.text
theme.fg_minimize = theme.lavender

theme.border_normal = theme.crust
theme.border_focus = theme.blue
theme.border_marked = theme.lavender

-- Generate taglist squares:
local taglist_square_size = dpi(10)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)
theme.taglist_disable_icon = true

-- Variables set for theming notifications:
theme.notification_font = "CaskaydiaCoveNerdFont 10"
theme.notification_margin = dpi(10)
theme.notification_border_color = theme.border_normal
theme.notification_border_width = theme.border_width
theme.notification_icon_size = dpi(60)

-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.menu_submenu_icon = ">"
theme.menu_height = 20
theme.menu_width = 160

return theme
