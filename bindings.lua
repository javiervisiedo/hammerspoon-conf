-- General key bindings
local module             = {}

module.start = function()
  local bindingsArray = {}
  -- Focus window takes left half side of screen
  table.insert(bindingsArray,
    hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local screen = win:screen()
      local max = screen:frame()

      f.x = max.x
      f.y = max.y
      f.w = max.w / 2
      f.h = max.h
      win:setFrame(f)
    end))

  -- Focus window takes right half side of screen
  table.insert(bindingsArray,
    hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local screen = win:screen()
      local max = screen:frame()

      f.x = max.x + (max.w / 2)
      f.y = max.y
      f.w = max.w / 2
      f.h = max.h
      win:setFrame(f)
    end))
end

-- TODO: stop all bindings?
module.stop = function()
  for i = 1, #bindingsArray do
    bindingsArray[i].delete()
  end
end

return module
