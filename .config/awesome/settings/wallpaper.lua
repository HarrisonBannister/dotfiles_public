local beautiful = require("beautiful")
local gears = require("gears")

-- {{{ Wallpaper
-- commented out for black background
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.fit()
    end
end
-- }}}
