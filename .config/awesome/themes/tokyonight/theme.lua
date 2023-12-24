-------------------------------------------
-- Awesome theme using Neovim tokyonight --
-------------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

-- General
theme.font = "CaskaydiaCoveNerdFont 9.5"
theme.useless_gap = 5
theme.border_width = 2
theme.border_radius = 10

-- Colors
theme.background = "#16161e"
theme.crust = "#414868"
theme.text = "#c0caf5"
theme.subtext0 = "#a9b1d6"
theme.blue = "#7aa2f7"
theme.lavender = "#bb9af7"
theme.cyan = "#7dcfff"
theme.green = "#9ece6a"
theme.yellow = "#e0af68"
theme.red = "#f7768e"

-- Theme variables
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

-- Generate taglist squares
local taglist_square_size = dpi(10)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)
theme.taglist_disable_icon = true

-- Notifications
theme.notification_font = theme.font
theme.notification_bg = theme.background
theme.notification_fg = theme.text
theme.notification_border_color = theme.border_normal
theme.notification_border_width = theme.border_width
theme.notification_margin = dpi(10)
theme.notification_icon_size = dpi(60)

-- Menu
theme.menu_submenu_icon = ">"
theme.menu_height = 20
theme.menu_width = 160

-- Icons
theme.icons_awesome = "a"
theme.icons_layout = "l"
theme.icons_terminal = "t"
theme.icons_browsere = "b"
theme.icons_file = "f"

return theme
