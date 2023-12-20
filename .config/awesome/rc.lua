-- If LuaRocks is installed, make sure that packages installed through it are
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
require("awful.hotkeys_popup.keys")

-- Error handling
-- Check if awesome encountered an error during startup (only runs on fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

-- Variable Definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/themes/onedark/theme.lua")

terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox"
music = terminal .. " -e spt"
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.spiral,
}

-- Define the layout options
local layout_tile = {
    name = "Tile",
    icon = beautiful.layout_tile_icon,
    layout = awful.layout.suit.tile
}

local layout_floating = {
    name = "Floating",
    icon = beautiful.layout_floating_icon,
    layout = awful.layout.suit.floating
}

local layout_spiral = {
    name = "Spiral",
    icon = beautiful.layout_spiral_icon,
    layout = awful.layout.suit.spiral
}

-- Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Manual", terminal .. " -e man awesome" },
   { "Edit config", editor_cmd .. " " .. awesome.conffile },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "Awesome", myawesomemenu },
                                    { "Layouts",
                                      {
                                        { layout_tile.name, function() awful.layout.set(layout_tile.layout) end },
                                        { layout_floating.name, function() awful.layout.set(layout_floating.layout) end },
                                        { layout_spiral.name, function() awful.layout.set(layout_spiral.layout) end }
                                      }
                                    },
                                    { "Terminal", terminal },
                                    { "File Manager", "dolphin" },
                                    { "Browser", browser },
                                    { "Music", music }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1","2","3","4","5","6","7","8" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 36, opacity = 0.0 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        --s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end)

-- Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey, }, "o", hotkeys_popup.show_help,
              {description = "show help", group="Awesome"}),
    awful.key({ modkey, }, "h", awful.tag.viewprev,
              {description = "view previous", group = "Awesome"}),
    awful.key({ modkey, }, "l",  awful.tag.viewnext,
              {description = "view next", group = "Awesome"}),
    awful.key({ modkey, }, "t", function () awful.client.focus.byidx(1) end,
              {description = "focus next by index", group = "Client"}),
    -- awful.key({ modkey, }, "h", function () awful.client.focus.byidx(-1) end,
    --           {description = "focus previous by index", group = "Client"}),
    awful.key({ modkey, }, ",", function () mymainmenu:show() end,
              {description = "show awesome menu", group = "Awesome"}),
	
    -- Client
    awful.key({ modkey, "Shift" }, "h", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "Client"}),
    awful.key({ modkey, "Shift" }, "t", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "Client"}),
    awful.key({ modkey, }, "g", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "Client"}),


    -- Layout
    awful.key({ modkey, }, "n", function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "Layout"}),
    awful.key({ modkey, }, "d", function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "Layout"}),
    awful.key({ modkey, "Shift" }, "d", function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "Layout"}),
    awful.key({ modkey, "Shift" }, "n", function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "Layout"}),
    awful.key({ modkey, "Control" }, "d", function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "Layout"}),
    awful.key({ modkey, "Control" }, "n", function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "Layout"}),
    awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "Layout"}),

    -- Awesome
    awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "Awesome"}),
    awful.key({ modkey, }, "f", function () awful.spawn("alacritty --class AlacrittyFloating") end,
              {description = "open a terminal w/ fetch", group = "Awesome"}),
    awful.key({ modkey, }, "v", function() awful.spawn.with_shell("alacritty -e nvim") end,
              {description = "open nvim", group = "Awesome"}),
    awful.key({ modkey, }, "b", function () awful.spawn(browser) end,
    	      {description = "open a browser", group = "Awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "Awesome"}),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
              {description = "quit awesome", group = "Awesome"}),
    awful.key({ modkey, }, "space", function () awful.spawn.with_shell("bash ~/.local/bin/keyboard-layout.sh") end,
              {description = "toggle keyboard layout", group = "Awesome"}),

		-- F(unction) Keys
    awful.key({ }, "F4", function () awful.spawn.with_shell("bash ~/.local/bin/toggle-monitor.sh") end,
              {description = "toggle monitor", group = "Function"}),
    awful.key({ }, "F6", function () awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle") end,
              {description = "toggle mute", group = "Function"}),
    awful.key({ }, "F7", function () awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -10%") end,
              {description = "decrease volume", group = "Function"}),
    awful.key({ }, "F8", function () awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +10%") end,
              {description = "increase volume", group = "Function"}),

    -- Rofi Menubar
    awful.key({ modkey, "Shift" }, "Return", function() awful.util.spawn_with_shell("bash ~/.config/rofi/launchers/type-1/launcher.sh") end,
              {description = "show rofi drun", group = "Menu"}),
    awful.key({ modkey, "Shift" }, "w", function() awful.util.spawn_with_shell("bash ~/.config/rofi/applets/bin/rofi-wifi-menu.sh") end,
              {description = "show rofi wifi", group = "Menu"}),
    awful.key({ modkey, "Shift" }, "v", function() awful.util.spawn_with_shell('rofi -modi emoji -show emoji') end,
              {description = "show rofi emoji", group = "Menu"}),
    awful.key({ modkey, "Shift" }, "Escape", function() awful.util.spawn_with_shell("bash ~/.config/rofi/powermenu/type-2/powermenu.sh") end,
              {description = "show rofi power", group = "Menu"}),
    awful.key({ modkey, "Shift" }, "s", function() awful.util.spawn_with_shell("flameshot gui") end,
              { description = "screenshot with flameshot", group = "Menu"})
)

clientkeys = gears.table.join(
    awful.key({ modkey, }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "Client"}),
    awful.key({ modkey, }, "c", function (c) c:kill()                         end,
              {description = "close", group = "Client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "Client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "Client"}),
    awful.key({ modkey, }, "o", function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "Client"}),
    awful.key({ modkey, }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "Client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "Client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "Client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "Tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "Tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "Tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "Tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
            "DTA",  -- Firefox addon DownThemAll.
            "copyq",  -- Includes session name in class.
            "pinentry",
        },
        class = {
            "floating",
            "Arandr",
            "Blueman-manager",
            "Gpick",
            "Kruler",
            "MessageWin",  -- kalarm.
            "Sxiv",
            "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
            "Wpa_gui",
            "veromix",
            "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
            "Event Tester",  -- xev.
        },
        role = {
            "AlarmWindow",  -- Thunderbird's calendar.
            "ConfigManager",  -- Thunderbird's about:config.
            "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { 
          floating = true,
          placement = awful.placement.centered,
          width = 800,
          height = 500,
      }},

    -- Alacritty Floating Window
    { rule_any = {
        class = { "AlacrittyFloating" },
      }, properties = { 
          floating = true,
          placement = awful.placement.centered,
          width = 550,
          height = 150,
          ontop = true;
      }},


    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    { rule_any = { class = { "Polybar" } } }, 
    properties = { size_hints_honor = false,
                   border_width = 0,
                   --above = true,
                   focusable = false,
                   skip_taskbar = true,
                   --ontop = true,
                   height = 35 }                    
}

-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
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

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Round the corners for the windows
client.connect_signal("manage", function (c)
    c.shape = function(cr,w,h)
        gears.shape.rounded_rect(cr,w,h,6)
    end
end)

-- Set the wallpaper
--gears.wallpaper.maximized("~/Downloads/abstract-lines-wallpaper.jpg", s)
awful.util.spawn_with_shell("nitrogen ~/pictures/wallpapers/nasadark.png --set-zoom-fill")

-- Start Applications
awful.util.spawn_with_shell("polybar longbar")

awful.util.spawn_with_shell("~/.config/picom/build/src/picom -b --animations --animation-window-mass 0.5 --animation-for-open-window zoom --animation-stiffness 350 -i 1")

-- Switch Keyboard Layout to Dvorak
-- awful.util.spawn_with_shell("setxkbmap -layout us -variant dvorak")
