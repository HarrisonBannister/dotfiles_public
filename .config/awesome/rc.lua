-- Config based on several authors
-- pw4ever: https://github.com/pw4ever/awesome-wm-config
-- tpruzina: https://github.com/tpruzina/awesomerc
-- xero: https://github.com/xero/dotfiles

-- {{{ Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- Extension library
local lain = require("lain") -- widgets and layouts
local vicious = require("vicious") -- widgets
local blingbling = require("blingbling") -- pretty widgets
local net_widgets = require("net_widgets") -- network widget
-- local require("eminent") --dynamic tagging system
-- App Menu Scripts
--local applicationsmenu = require("applicationsmenu")
local xdg_menu = require("archmenu")

-- EXTENSIONS (functions etc)
local myro  = require("myrc.run_once")  -- run app as long it's not running already
local myerr = require("myrc.error")     -- error reporting
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(awful.util.getdir("config") .. "/themes/dust/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt" or "xterm"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey     = "Mod4"
altkey     = "Mod1"
terminal   = "urxvt" or "uxterm"
editor     = os.getenv("EDITOR") or "nano" or "vim"
editor_cmd = terminal .. " -e " .. editor
-- user defined
browser    = "firefox"
browser2   = "chromium"
gui_editor = "atom"
graphics   = "gimp"
mail       = "thunderbird"
-- }}}

-- Default modkey (DEFAULT Mod4 = WinKey)
modkey = "Mod4"

-- TAGS (screens) && LAYOUTS
require("settings.tags")

-- MENUS (menubar, etc)
require("settings.menus")

-- WIBOX (widgets)
require("stock.wiboxrc")

-- KEY && MOUSE BINDINGS
require("stock.binds")
--require("settings.custom_binds")
root.keys(globalkeys) -- this actually sets the keys

-- WINDOW RULES
-- rules per app (placement, floating, etc)
require("settings.window_rules")

-- SIGNALS
-- function to execute when a new client appears.
require("stock.signals")

-- STARTUP
--require("settings.startup")

-- wallpaper snippet
local mywp = require("settings.wallpaper")
