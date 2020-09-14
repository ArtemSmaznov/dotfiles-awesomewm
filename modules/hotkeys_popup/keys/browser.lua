---------------------------------------------------------------------------
--- Firefox hotkeys for awful.hotkeys_widget
--
-- @author Jonathan &lt;jonathan@tinypulse.com&gt;
-- @copyright 2017 Jonathan
-- @submodule awful.hotkeys_popup
---------------------------------------------------------------------------

local hotkeys_popup = require("modules.hotkeys_popup.widget")
local fire_rule = { class = { "Firefox", "Google-chrome", "Chromium" } }
for group_name, group_data in pairs({
    ["Browser: tabs"] = { color = "#009F00", rule_any = fire_rule }
}) do
    hotkeys_popup.add_group_rules(group_name, group_data)
end

local browser_keys = {

    ["Browser: tabs"] = {{
        modifiers = { "Ctrl" },
        keys = {
            t = "new tab",
            w = 'close tab',
            ['Tab'] = "next tab",
            ["1..9"] = "go to tab"
        }
    }, {
        modifiers = { "Ctrl", "Shift" },
        keys = {
          ['Tab'] = "previous tab",
          t = 'reopen last closed tab'
        }
    }}
}

hotkeys_popup.add_hotkeys(browser_keys)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
