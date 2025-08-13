# 🌟 Common TWRP Device Tree (s5e8535)  

This repository hosts the **common device tree for Samsung Exynos devices** based on the **s5e8535 CPU/board**.  
It provides a shared foundation for multiple device-specific trees, simplifying development and maintenance across devices.

## 📱 Supported Devices  

| Device Codename | Device Name           | SoC      | Status       |
|-----------------|---------------------|---------|-------------|
| m14x            | Galaxy M14 5G / F14 5G | Exynos 1330 | ✅ Maintained |
| a14x            | Galaxy A14 5G         | Exynos 1330 | ✅ Maintained |

> Device-specific trees that depend on this common tree:  
> - [`m14x`](https://github.com/AshutoshProjects/twrp_device_samsung_m14x) → M14 5G / F14 5G  
> - [`a14x`](https://github.com/AshutoshProjects/twrp_device_samsung_a14x) → A14 5G

## ⚙️ Building TWRP Recovery  

Follow these steps to build TWRP recovery for devices using this common tree:

```
# Initialize the build environment
. build/envsetup.sh

# Allow missing dependencies
export ALLOW_MISSING_DEPENDENCIES=true

# Choose the device
lunch twrp_<device_codename>-eng

# Build the recovery image
mka recoveryimage
```
> The compiled recovery image will include all shared components from the common tree.

## 📝 License
This project is licensed under the **GNU General Public License v3.0 (GPLv3)**.  
© AshutoshProjects 2025
