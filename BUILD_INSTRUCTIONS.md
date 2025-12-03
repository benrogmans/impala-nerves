# Building the Custom Nerves System for ARK1124H

## Overview

A custom Nerves system has been created with Intel Bay Trail drivers for the ARK1124H (Intel Atom E3825). The custom system is located at `../nerves_system_x86_64_ark1124h`.

## Added Drivers

The following Intel drivers have been added to the kernel configuration:

- **Intel Graphics (DRM_I915)** - Critical for Bay Trail display
- **Intel Chipset Support (LPSS)** - Low Power Subsystem
- **Intel ACPI Drivers** - Power management and hardware detection
- **Intel Network Drivers** - E1000, E1000E, IGB
- **Intel Audio Drivers** - HDA Intel
- **Bay Trail Pin Control** - Hardware pin configuration

## Build Steps

### 1. Build the Custom Nerves System

```bash
cd ../nerves_system_x86_64_ark1124h
export MIX_TARGET=x86_64
mix deps.get
mix firmware
```

**Note:** Building the system can take 30-60 minutes as it compiles the Linux kernel with the new drivers.

### 2. Build Your Application Firmware

```bash
cd ../advantech-ark1124
export MIX_TARGET=x86_64
mix deps.get
mix firmware
mix firmware.burn
```

### 3. Test on ARK1124H

- Insert the USB drive
- Boot from USB
- The system should now boot successfully with Intel drivers loaded

## Troubleshooting

If you still experience issues:

1. **Check kernel messages:** If you have serial console access, check for kernel errors
2. **Verify drivers:** Check `dmesg` output for driver loading messages
3. **BIOS settings:** Ensure OS Selection is set to "Intel Linux" and watchdog is disabled

## Customization

To modify the kernel configuration:

1. Edit `../nerves_system_x86_64_ark1124h/linux-6.12.defconfig`
2. Rebuild the system: `cd ../nerves_system_x86_64_ark1124h && mix firmware`
3. Rebuild your application: `cd ../advantech-ark1124 && mix firmware`

