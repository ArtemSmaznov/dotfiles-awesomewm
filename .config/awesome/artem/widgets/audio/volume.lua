local awful = require("awful")
local icons = require('themes.icons')
local wibox = require("wibox")
local myicon = require('themes.UI.icon')
local myslider = require('themes.UI.slider')

local slider = wibox.widget(
	{
		widget = myslider
	}
)

local icon = wibox.widget{
	widget = myicon(icons.audio_high, 20)
}


function increaseVolume()
	awful.spawn('amixer -D pulse sset Master 5%+ unmute')
	updateMuteState(false)
	setVolume ()
end

function decreaseVolume()
	awful.spawn('amixer -D pulse sset Master 5%- unmute')
	updateMuteState(false)
	setVolume ()
end

function muteVolume(state)
	if state == true then
		awful.spawn('amixer -D pulse set Master mute')
		updateMuteState(state)
	elseif state == false then
		awful.spawn('amixer -D pulse set Master unmute')
		updateMuteState(state)
	elseif state == 'toggle' then
		awful.spawn.easy_async([[bash -c "amixer -D pulse sget Master"]],
		function(stdout)
			mute = string.match(stdout, '%[(o%D%D?)%]')
			if mute == 'on' then
				muteVolume(true)
			else
				muteVolume(false)
			end
		end)
	end
end

function setVolume ()
	awful.spawn.easy_async([[bash -c "amixer -D pulse sget Master"]],
	  function(stdout)
	    local volume = string.match(stdout, '(%d?%d?%d)%%')
		slider:set_value(tonumber(volume))
	end)
end

setVolume()

function updateMuteState (targetState)
	if targetState == true then
		slider:set_color('#777')
		icon:set_image(icons.audio_muted)
	elseif targetState == false then
		slider:set_color('#CCC')
		icon:set_image(icons.audio_high)

	end
end


volume_setting = wibox.widget {
	icon,
	slider,
	spacing = 10,
    layout  = wibox.layout.fixed.horizontal
}


return volume_setting

