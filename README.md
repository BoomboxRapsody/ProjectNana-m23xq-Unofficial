# What is Project Nana?
- Project Nana is a project that bring higher One UI version like 8.0, 8.5, etc... to old phone and unlock HighEnd/flagship feature for budget/midrange variant, still a small project that handle by BoomboxRapsody.  
- Important, it based on the UN1CA & QuantumROM build system which allows automatic downloading/extraction of the firmware, applying the required patches and generating a flashable zip or product.img and system.img file package for the specified target device. Especially, its build system allows to automatically download/extract the firmware, apply the required patches and generates a flashable zip or product.img and system.img file package for the specified device.

- Any form of contribution, suggestions, bug report or feature request for the project will be welcome.

## Features:
- Based on the latest Samsung devices One UI 8.5 firmware:
  - Galaxy S23 - S911B, dm1q (Paradigm)
  - Galaxy S23 FE - S711B, r11s (Paradigm)
  - Galaxy A16 5G - A166P/A166B/A166M, a16xm/a16x (Recored, for A22 only)
  - Galaxy A17 5G - A176B, a17x (Recored, for A22 only)
  - Galaxy A26 5G - A266B, a26x (Eureka for A22)
  - Galaxy A35 5G/A36 5G - A356B/A366B, a35x/a36xq (Eureka for A32)
- Full Galaxy AI support from Galaxy S23-S24-S25, except Audio Eraser and Now brief
- Full Awesome Intelligence features support from Galaxy A26 5G, A36 5G, A56 5G (Eureka A22 - Galaxy A26 5G base & Eureka A32 - Galaxy A36 5G? base, Galaxy A36 5G? base because I'm not sure Eureka for A32 variant too), and especially, in the Eureka A22 and Eureka A32 variant (Galaxy A26 5G/A36 5G base) will support fully both Galaxy AI and Awesome Intelligence features simultaneously.
- App Lock Support
- HighEnd animations
- Screenshots from Secure Apps support
- ASKS disabled 
- Bixby and Bixby wake-up supported (normally debloated/not supported in QuantumROM build system)
- Native/live blur support (Paradigm)
- Adaptive refresh rate support (Paradigm)
- Extra brightness support
- Picture remaster support
- Object, shadow and reflection eraser support
- Image clipper support
- Smart Suggestions widget available
- Multi user support
- Samsung DeX support (Paradigm)
- Camera privacy toggle support
- Debloated from useless system services/additional apps
- [BluetoothLibraryPatcher](https://github.com/3arthur6/BluetoothLibraryPatcher) included (also included this feature in the QuantumROM build system)
- [KnoxPatch](https://github.com/salvogiangri/KnoxPatch) implemented in system frameworks (also included this feature in the QuantumROM build system)

# 📌 Overview of this QuantumROM builder based in this project:
This Custom ROM is built by combining and refining features from multiple projects, including UN1CA, Legacy-UI, and AstroROM.
- The goal of this ROM is to provide a clean, optimized, and stable One UI experience with enhanced usability and performance.

## 🛠️ Tools features:
- Download firmware directly from Samsung server.
- File config and file contexts generate.
- Extract and img build (erofs and ext4 supported).

## ✨ Key features:
- System Optimization.
- Heavy debloated system (removed unnecessary apps & services).
- Improved performance and smoother UI experience.
- Optimized background processes.
- Better battery efficiency.
- Enhanced Functionality.
- Screenshot anywhere (enabled globally).
- Built-in Screen Recorder.
- More floating features enabled.
- Edge features fully working.
- Stock device config always be added.
- Extra brightness support.
- Object, shadow and reflection remover support.
- Multi user support.
- Camera privacy toggle support.
- Private Share patch.
- Google Photos unlimited backup.
- JDM device support.
- [BluetoothLibraryPatcher](https://github.com/3arthur6/BluetoothLibraryPatcher) integrated

## 🔐 Security & Privacy:
- Secure Folder support.
- Essential security components retained.
- Stable and safe daily-driver experience.

## 📱 One UI experience:
- Full One UI apps included.
- Important system apps preserved.
- China Smart Manager support.
- AI features enabled.

## 🎯 Builder Goal:
- To deliver a lightweight yet fully featured Samsung One UI ROM that balances.
- Performance.
- Stability.
- Essential Features.
- Clean User Experience.

# How to use this QuantumROM builder that based in this project:
#### 1. Fork the Repository.
Give a ⭐ star to the repository.
Fork the repository to your GitHub account.

#### 2. Run the Workflow.
Open your forked repository.
- Go to the Actions tab.
- Select UltimateM23 Tools.
- Click Run workflow.

#### 3. Set Your Device Information.
- Configure the following options:
- TARGET_DEVICE_MODEL
- The your device model.
- STOCK_DEVICE_CSC
- The country/region code used to download the stock device firmware.
- STOCK_DEVICE_IMEI
- Required to download the stock device firmware from the Samsung server.
- Change the IMEI if you want to change the stock device.

#### 4. Kernel BPF Version Option.
Set this o
ption to True if your kernel BPF version is 5.4 (lower than 5.10).
- Otherwise, set it to False.

#### 5. Set Target Device Information.
- Configure the following options:
- TARGET_DEVICE_MODEL
- The device model from which you want to port the ROM.
- TARGET_DEVICE_CSC
- The country/region code used to download the target device firmware.
- TARGET_DEVICE_IMEI
- Required to download the target device firmware from the Samsung server.
- Change the IMEI if you want to change the target device.

#### 6. OUTPUT_FILESYSTEM (erofs / ext4 / f2fs).
My tool can build images in two formats:
- erofs
  - Recommended if your device partition size is small.
  - Saves storage space.
  - Your kernel must support EROFS.
- ext4
  - Use this if your kernel does not support EROFS.
  - The generated image will be larger in size.
- f2fs
  - Recommended if your device partition size is small. (Not better than EROFS)
  - Saves storage space.
  - Your kernel must support F2FS.

#### 7. Compress IMG to XZ (True / False).
If set to True:
 - The generated image will be compressed to .xz format.
 - This reduces file size before uploading.

If set to False:
 - The image will remain in its original format without compression.
   
#### 8. Add Git Credentials:
In your forked repository, go to:
-Settings → Secrets and variables → Actions
- Click **New repository secret**, then create a new secret:
- Name:
  - GIT_TOKEN
  - Add git secret token and save.
  - You can search on YouTube for a guide on how to create a GitHub Personal Access Token.
  - If you do not add the `GIT_TOKEN`, the built ROM info and link will not be added to your repository's Release section. You will get link only in runner output.

### Credits:
#### 1. Samsung Firmware Downloader.
- martinetd
- https://github.com/martinetd/samloader
- Used for downloading Samsung firmware.

#### 2. Multi Disabler.
- ianmacd
- https://github.com/ianmacd/multidisabler-samsung
- Used for disabling Samsung security and data encryption.

#### 3. Bluetooth Library Patcher.
- 3arthur6
- https://github.com/3arthur6/BluetoothLibraryPatcher
- Used for patching Samsung Bluetooth libraries.

#### 4. UN1CA Project.
- salvogiangri
- https://github.com/salvogiangri/UN1CA

#### Components Used from UN1CA.
- `HEX_PATCH` function (modified from UN1CA implementation)
- Knox Patch (from UN1CA)
- Secure Folder Patch (from UN1CA)
- Knox Guard Patch (from UN1CA)
- Secure Flag Patch (from UN1CA)
- SSRM Patch (from UN1CA)
- Some SELinux patches followed the UN1CA implementation.

#### 5. App optimization stuck fix.
- ExtremeXT
- https://github.com/ExtremeXT
- For app optimization stuck fix.

#### 6. Google photos unlimited backup.
- VehanRajintha
- https://github.com/VehanRajintha/Free-Unlimited-Google-Cloud-Backup-Magisk-Module

#### 7. ChatGPT.
- https://chat.openai.com
- For providing bash commands and bash functions according to the project requirements and instructions.

#### 8. GoFile Uploader.
- Sushrut1101
- https://github.com/Sushrut1101/GoFile-Upload

#### 9. OMC Decoder.
- fei-ke
- https://github.com/fei-ke/OmcTextDecoder

#### 10. apktool.
- iBotPeaches
- https://github.com/ibotpeaches/apktool

### Licensing.
This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.
- **[android-tools](https://github.com/nmeum/android-tools)** - Licensed under Apache License 2.0
- **[apktool](https://github.com/iBotPeaches/Apktool)** - Licensed under Apache License 2.0  
- **[erofs-utils](https://github.com/sekaiacg/erofs-utils)** - Dual licensed (GPL-2.0, Apache-2.0)
- **[platform_build](https://android.googlesource.com/platform/build)** - Licensed under Apache License 2.0
- **[e2fsprogs](https://github.com/tytso/e2fsprogs)** - Licensed under GPL-2.0 / LGPL-2.1
