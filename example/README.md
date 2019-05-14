# Example

`kiosk_system_x86_64` example app

## Getting Started

To start your Nerves app:

Set the target
```bash
export MIX_TARGET=x86_64
```

Set the url to display
```bash
export KIOSK_URL=https://google.com
```

Build and Burn firmware
```bash
mix do deps.get, firmware.burn
```
