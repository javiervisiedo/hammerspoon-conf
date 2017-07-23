-- Reload any changes made to the config files automatically

return hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', function()
  hs.reload()

  hs.notify.new({
    title    = 'Hammerspoon',
    subTitle = 'Config reloaded!'
  }):send()
end)
