awesome.connect_signal(
  'module::airplane_mode:enable',
  function()
    awesome.emit_signal('module::network:disable')
    awesome.emit_signal('module::wifi:disable')
    awesome.emit_signal('icon::airplane_mode:update', true)
  end
)

awesome.connect_signal(
  'module::airplane_mode:disable',
  function()
    -- Required Logic
    -- if wifi/network was available prior to activated
    -- then restore that state
    awesome.emit_signal('icon::airplane_mode:update', false)
  end
)
