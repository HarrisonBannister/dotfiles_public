local awful = require("awful")
local beautiful = require("beautiful")

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
                     size_hints_honor = false } },
    -- All windows that should float
    { rule_any = { class = { "MPlayer", "pinentry", "Gimp", "Guake", "feh", "vlc", "mpv" } },
	  properties = { floating = true } },

	-- Browsers
	{ rule = { role = "browser" },
	  properties = { tag = tags[1][1],
	  switchtotag = tags[1][1] } },
	{ rule_any = { class = { "Firefox", "Iceweasel", "luakit", "Chrome", "Chromium" } },
	  properties = { tag = tags[1][1] } },

	-- Coding
	{ rule = { role = "editor" },
	  properties = { tag = tags[1][2] } },
	{ rule_any = { class = { "Eclipse", "Leafpad", "Geany", "vim", "Emacs", "Atom", "Sublime_text" } },
	  properties = { tag = tags[1][2] } },

	-- Terminals
	{ rule = { role = "terminal" },
	  properties = { tag = tags[1][3] } },
	{ rule_any = { instance = { "mutt", "ncmpc" } },
	  properties = { tag = tags[1][3] } },
	{ rule_any = { class = { "URxvt", "Xterm", "UXterm", "Tmux", "Terminator", "Byobu" } },
	  properties = { tag = tags[1][3] } },

	-- Office
	{ rule_any = { class = { "libreoffice", "OpenOffice.org*" } },
	  properties = { tag = tags[1][4] } },
	{ rule = { instance = "libreoffice-*" },
	  properties = { tag = tags[1][4] } },
	{ rule = { name = "LibreOffice" },
	  properties = { tag = tags[1][4] } },

	-- Email / Chat
	{ rule_any = { class = { "Thundebird", "Weechat", "irssi", "Skype", "Mutt", "Xchat", "Pidgin" } },
	  properties = { tag = tags[1][5] } },

    -- Conky and other static windows
	{ rule = { class = "Conky" },
          properties = { floating = true,
          sticky = true,
          ontop = false,
	      border_width = 0,
	      opacity = 1,
          focusable = false,
          skip_taskbar = true } },
}
-- }}}
