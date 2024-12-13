## PipeWire
Improved audio and video handling on Linux (over PulseAudio and JACK).

### WirePlumber
WirePlumber is a session and policy manager for PipeWire.

ArchWiki on configuration, listing interfaces, and disabling devices/nodes: <https://wiki.archlinux.org/title/WirePlumber>.

### Disable Built-in Microphone
```bash
wpctl status # list stuff
wpctl inspect 123 # get details
```

```lua
-- `~/.config/wireplumber/main.lua.d/51-disable-builtin-microphone.lua`

rule = {
	matches = {
		{
			{ "node.name", "equals", "alsa_input.pci-0000_00_1f.3.analog-stereo" },
			{ "media.class", "equals", "Audio/Source" },
		},
	},
	apply_properties = {
		[ "node.disabled" ] = true,
	},
}

table.insert(alsa_monitor.rules, rule)
```

_**Note**: The GNOME Settings UI will still show the built-in microphone as it lists devices independently of PipeWire.
However, applications actually getting sound through PipeWire will be unable to access this device.
Link: <https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2363#note_1620448>._

### Disable HDMI Audio
Source: <https://blog.zenlinux.com/2022/08/how-to-disable-audio-devices-in-pipewire-wireplumber/>.

```lua
-- `~/.config/wireplumber/main.lua.d/51-disable-hdmi-audio.lua`

rule = {
	matches = {
		{
			{ "device.name", "equals", "alsa_card.pci-0000_01_00.1" },
		},
	},
	apply_properties = {
		[ "device.disabled" ] = true,
	},
}

table.insert(alsa_monitor.rules, rule)
```
