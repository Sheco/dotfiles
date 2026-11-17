
## Host setup

On the device that will act as the audio host, create ~/.config/pipewire/pipewire-pulse.conf.d/network.conf

Edit the LAN subnets to match your network.

```
pulse.cmd = [
  { cmd = "load-module" args = "module-native-protocol-tcp port=4713 auth-ip-acl=127.0.0.1;192.168.0.0/16;10.0.0.0/8" }
  { cmd = "load-module" args = "module-zeroconf-publish" }
]
```

Restart pipewire

```
systemctl --user restart pipewire pipewire-pulse
```

## Client setup

On the device that will act as the audio client, create ~/.config/pipewire/pipewire.conf.d/audio-tunnel.conf

Edit the server.address and the stream.props

```
context.modules = [
  {
    name = libpipewire-module-pulse-tunnel
    args = {
      tunnel.mode = sink
      pulse.server.address = "tcp:192.168.254.2:4713"
      reconnect.interval.ms = 5000
      audio.rate = 48000
      audio.channels = 2
      audio.position = [ FL FR ]
      stream.props = {
        node.name = "steamdeck"
        node.description = "Steam Deck"
      }
    }
  }
]
```

Restart pipewire

```
systemctl --user restart pipewire pipewire-pulse
```
