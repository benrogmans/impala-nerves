# Advantech ARK1124H Nerves System

Nerves-based embedded system for the Advantech ARK1124H mini PC.

## Hardware

- **Device**: Advantech ARK1124H
- **Architecture**: x86_64
- **System**: Generic Nerves x86_64 image

## Prerequisites

- Elixir >= 1.13
- Erlang/OTP >= 24
- Nerves toolchain for x86_64
- fwup >= 1.0.0 (for firmware creation)

## Setup

1. Install the Nerves bootstrap archive:
```bash
mix archive.install hex nerves_bootstrap
```

2. Set the target:
```bash
export MIX_TARGET=x86_64
```

3. Install Nerves dependencies:
```bash
mix deps.get
```

4. Build the firmware:
```bash
mix firmware
```

5. Create a bootable image:
```bash
mix firmware.burn
```

## Configuration

The system uses a **custom** `nerves_system_x86_64` image located at `../nerves_system_x86_64_ark1124h` with Intel Bay Trail drivers enabled for the ARK1124H (Intel Atom E3825). The custom system includes:

- Intel graphics drivers (DRM_I915) - Required for Bay Trail
- Intel chipset support (LPSS)
- Intel ACPI drivers
- Intel network drivers (E1000, E1000E, IGB)
- Intel audio drivers (HDA)

Customizations can be added in:
- `config/target.exs` - Target-specific configuration
- `rootfs_overlay/` - Filesystem overlays (create if needed)

## Development

To connect to the device via IEx:
```bash
mix firmware.gen.script
./upload.sh
```

## Customization

For Advantech ARK1124H-specific customizations:
1. Hardware-specific drivers can be added as dependencies in `mix.exs`
2. System configuration can be modified in `config/target.exs`
3. Application code goes in `lib/advantech_ark1124/`

