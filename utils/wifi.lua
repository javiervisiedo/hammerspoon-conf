local cache  = {}
local module = { cache = cache }

function loadWiFi(ssid)
  hs.osascript.applescript([[
    tell application "System Events"
      tell process "SystemUIServer"
          click (menu bar item 1 of menu bar 1 whose description contains "Wi-Fi")
          click menu item "]] .. ssid .. [[" of menu 1 of result
      end tell
    end tell]])
end

module.start = function()

  local bindingsArray = {}

  -- Connect to VPN wifi
  table.insert(bindingsArray,
    hs.hotkey.bind({"cmd", "alt", "ctrl"}, "s", function()
      loadWiFi(vpnWiFiSsid)
      --hs.wifi.associate("mySSID", "myPassPhrase")
    end))

  -- Connect to regular wifi
  table.insert(bindingsArray,
    hs.hotkey.bind({"cmd", "alt", "ctrl"}, "d", function()
      loadWiFi(regularWiFiSsid)
      --hs.wifi.associate("mySSID", "myPassPhrase")
    end))

end

module.stop = function()
  for i = 1, #bindingsArray do
    bindingsArray[i].delete()
  end
end

return module
