  -- List of apps to start by default on some actions
  default = {
    terminal = 'terminator',
    browser = 'google-chrome-stable',
    editor = os.getenv("EDITOR") or "nano",
    ide = 'code',
    social = 'whatsapp-nativefier-dark',
    game = 'steam',
    files = 'nemo',
    graphics = 'gimp'
  }
  -- List of apps to start once on start-up
  run_on_start_up = {
     'steam -silent', -- launch steam
     'ckb-next -b', -- ckb-next
     'redshift-gtk', -- redshift
     'pia-client --quiet', -- VPN
  }
