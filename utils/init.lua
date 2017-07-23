local cache  = {}
local module = { cache = cache }

module.start = function()
  hs.fnutils.each(utils.enabled, function(utilName)
    cache[utilName] = require('utils.' .. utilName)
    cache[utilName]:start()
  end)
end

module.stop = function()
  hs.fnutils.each(cache, function(util)
    util:stop()
  end)
end

return module
