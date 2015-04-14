local awful = require("awful")

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
--    awful.layout.suit.floating,
    awful.layout.suit.tile,		-- 1
--    awful.layout.suit.tile.left,
--    awful.layout.suit.tile.bottom,
--    awful.layout.suit.tile.top,
    awful.layout.suit.fair,			-- 2
--    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,-- 3
    awful.layout.suit.max,			-- 4
--    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = { names = { "[www]", "[code]", "[term]", "[office]", "[comm]" },
		 layout = { layouts[4], layouts[1], layouts[3], layouts[2], layouts[2] }
	   }
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}
