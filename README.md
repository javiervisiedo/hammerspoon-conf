# My Hammerspoon configuration scripts
Lua scripts for my configuration of [Hammerspoon](http://www.hammerspoon.org/). This is the very first commit, still almost a skeleton. I will be gradually adding more functionality.

I just started with Hammerspoon and Lua scripting. My goal is to define a flexible tiling system to automate windows placement. In addition it would add some key bindings and some other functionality as I understand more about how Hammerspoon works, and what else I could use it for.

I started playing around with Hammerspoon on my iMac. Once I get to something decent I will start with the adaptations to my MacBook. That would most likely include configurations for multiple monitors.

## Getting started
At this stage, I would not recommend to clone this repo, since it is a rough draft. In any case, feel free to download for inspiration, or just copy some functionality as you fancy.

1. You obviously need to have [Hammerspoon](http://www.hammerspoon.org/) installed in your Mac
2. `git clone git@github.com:redmice/hammerspoon-conf.git`
3. Modify the [configuration](## Configuration) at the root `init.lua`
4. Reload Hammerspoon configuration

## Modules
The following modules are available
* `reload`: Adds a watcher on the config files, and reloads the configuration automatically when any file changes
* `wifi`: Associate keybindings to different WiFi networks

## Configuration
The root `init.lua` file, contains all configuration options for these scripts.

### Enabling modules
The provided modules can be activated by adding them to the `utils.enabled` list.
All modules are activated by default.

`utils.enabled             = { 'reload', 'wifi' }`

Just remove any module you do not plan to use from the list.

### Configuring WiFi networks
The module `wifi` offer keybindings to switch between 2 WiFi networks. I added this functionality to be able to switch easily between my VPN router or a direct connection. The SSIDs are configured in the following 2 variables:
* `vpnWiFiSsid = "<your-SSID-1>"`: SSID for the VPN router
* `directWiFiSsid = "<your-SSID-2>"`: SSID for the direct router

Actually, Hammerspoon would not care if one of them is a VPN router or not, so just use it to commute between 2 whatever connections you like.

## Keybindings
### WiFi
* `Ctrl-Alt-Cmd S`: Connects to the `vpnWiFiSsid` access point
* `Ctrl-Alt-Cmd D`: Connects to the `directWiFiSsid` access point

### Windows
* `Ctrl-Alt-Cmd :arrow_right:`: Moves the focused window to the right part of the screen, and redimension to occupy all right half
* `Ctrl-Alt-Cmd :arrow_left:`:  Moves the focused window to the left part of the screen, and redimension to occupy all left half
