return {
  orientation = function (s_index)
    if s_index == 'Primary' then s_index = 1 end
    local screens = {}
    for s in screen do
      screens[s.index] = s.geometry.width < s.geometry.height and 'portrait' or 'landscape'
    end
    return screens[s_index]
  end,
}