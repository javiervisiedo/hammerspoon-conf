bindings                     = require('bindings')
utils                        = require('utils')

-- utils
utils.enabled             = { 'reload', 'wifi' }

-- wifi module configuration
vpnWiFiSsid = "3_14_Secure"
regularWiFiSsid = "LaCasitaDelBosque"

-- start modules
hs.fnutils.each({
  bindings,
  utils
}, function(module) module.start() end)

-- stop modules on shutdown
hs.shutdownCallback = function()
  -- save window positions in hs.settings
  window.persistPosition('store')

  -- stop modules
  hs.fnutils.each({
    bindings,
    utils
  }, function(module) module.stop() end)
end
