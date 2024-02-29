# General AI Toolkit Installation Guide

<p align="center">
  <img src="https://lh3.googleusercontent.com/fife/ALs6j_GSq4MJ3KyPj47PNRhYpKAu6F3FKx0bZRHxlrvmrbcffevP82NSaZJyD-ati4bfFvoMpuQTiabofleQZeobebh7Omm4iw1lvhjv8IKTOt_i7cEqLJiU8hk87q_Xj2mOI2V2b6SVp8ZZbEiF9PlrmelTwHgY-c1xpChAGRPM2TaO_daln4aZmG15iYrJZP9ZkHwkwSlMYwjtQkrHYWJR1EndWnGSkwLCZRW9f2W5iPsN42iAUDs7-OUdY7gM7sXzkE3nT6UUVoj7Hs7khtFwcW8RaQcOwoJ2vHaaj0hXJZgXU4sjzsnE-87ObUS5pPfvWn03uKpVcYF3iZwmD-s_iY3-47ltcMiP8Il2GiK0kwat2kDuuOqlcFb1qdm_Xy6_NgUro3S_mOWEj42YYSidVpbAlGQ4hWHXh7B-a5htLs7W-MeM58iKbBoSWQWQS3SjQIqN-o4RCCPPnJs-MgS0pH-Faxsp92azGPXGtL70udR0XTVWNDIqq7Ft1F-81RjZZQxnPEHNK3-b3YvXzSbhihrufVAyJqYWmt58A-oWpLreRLv9NGcb4XPkqvpYwTPaRvzQpeZyTwAcOo9z6Ho82DI2fMNfZrzeItJdDEav08oNXWgMrlHIqokga_oTU0MMI_3LVyFAvWtQOsil_Kn0Cdsl8UvfsvNoMBlxaWT3HrLyXbJhWt-dsG3mFH0nFFY00EKtKJ9ltgMzUn4d2JoRy0gQ_PPDLoPMesuOvjhBtZvUA3OopH2lApAL0ljFxQwAVui-ILgN6mvXpqRVoMOtQf8pbhxblLqoDQrIE3ht5eXG1qYVDsrjYDXslyFRJrFSc55-QudEF0wFsw1BtjYFFq2BLSs-OjTlINikeu4qEMFceo2YADMyw8p7WcpKSH6fJwX7Un3NlO-T6oAfzwZB1Tf0Ekxru_zwIMahyCkO-ErLagLC1iXA-saeXFL1v9DZ_OTPcVFYa_J0eWUhbygn_wGcFdfdFUb6NfQ7Q3jrmG49MeYMd_R4-7WsXR_1vrgID_Vp9Ko8pvahMRHmsmgzyzJdeEoifAHG_8PBbAI2PApqcYy_iVnsJdD8AL-FoziHxK03mdVp_yPyjdlgwS0YvAQzlm8hoiaBieWKFjAzfg57wNvMXsnMBBtvJ60VYMS5xoAMoAfQDI7edeOfqI-SVPm9gUcXaiyjNAk21QReMIH2UcBP_huCfYcsZheCpHNmC0OsQ32jKot8xE2mLLv8HQ9f2rcFaFDyk1XfahawDcLIA4JmTFUWhLtoHpITykwMwUn9tiIvKhArN6903Redf4Qe_4zxG3msiWYKjTEijEG9I2BCfLLaLl3hFC1h7auKYNINl9ursGVd8Dgn1cHvoOxxOsA0jrSuN5mMxwtFmzc4kGnU_7InL_Z4HZisppn1M6sj6l16Lcq005AUosXGn7HqBKlcx-k4dT18j1xRMHBXJE12UoJAFd0Gf8c08IIEdVmE0rgXnLaWn8fn8-tId-VJDEEbnA=s512" alt="General AI Toolkit Logo" width="320" height="200" style="border-radius: 12px; box-shadow: 0 0 10px violet;">
</p>

---

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Features](#features)
- [License](#license)

---

## Introduction

Hello and welcome to the **General AI Toolkit**, your one-stop shop for diving into the expansive universe of Artificial Intelligence and Machine Learning. Created from the ground up by a solo innovator, this toolkit aims to streamline the process of establishing a robust AI workspace on your computer. It's a perfect fit for everyone—whether you're an experienced data scientist, a hobbyist in AI, or a complete beginner. This toolkit provides you with cutting-edge utilities and libraries, making it easier than ever to turn your AI dreams into reality.

---

## Prerequisites

- Ubuntu 22.04
- NVIDIA 30 Series Graphics Card
- Internet connection

> **Note**: This toolkit is specifically designed to run on Ubuntu 22.04 and requires an NVIDIA 30 Series Graphics Card for optimal performance.

---

### Important Notes

- **Storage Requirements**: Installing all the packages and libraries will require several gigabytes of storage. Make sure you have sufficient disk space before proceeding with the installation.

- **Installation Time**: The installation process can be time-consuming, depending on your device's capabilities. Please be patient and allow the script to fully execute.

---

## Installation

To install the General AI Toolkit, simply run the provided installation script. This script will install a plethora of essential packages, libraries, and frameworks, including but not limited to CUDA 11.8, cuDNN 11.8, YOLOv5, OpenCV, and many more.

```bash
git clone https://github.com/Automa-Research/General-AI-Toolkit.git
cp General-AI-Toolkit/ubuntuBasicSetup.sh $HOME
chmod +x ubuntuBasicSetup.sh
./ubuntuBasicSetup.sh
```
> **⚠️ Important**: Do not run the script in sudo mode as it will install everything in the root directory and could mess up your system. You may need to reset your operating system to recover your storage. For the script to work correctly, it must be run from user home directory.

> **Note**: After installation and restarting the terminal, you might want to disable Conda's auto-activation feature. To do so, restart the terminal and run the following command:
>
> ```bash
> conda config --set auto_activate_base false
> ```
> This will prevent Conda from automatically activating its base environment every time you open a new terminal session.

---

## Features

### Basic Packages

- **v4l2loopback-dkms, build-essential, cmake, git, unzip, pkg-config**, and [more](All-Packages.md): Essential for general development.

> **Note**: The list above is not exhaustive. For a complete list of all the basic packages being installed, please refer to the [All-Packages.md](All-Packages.md) file.

### Computer Vision

- **OpenCV GPU Version**: High-performance computer vision library.
- **YOLOv5**: State-of-the-art object detection framework.
- **OpenPose GPU Version**: Real-time multi-person keypoint detection library for body, face, hands, and foot estimation.

### Machine Learning

- **scikit-learn, DLIB, face_recognition**: Popular machine learning libraries.
- **TensorFlow**: Open-source platform for machine learning.
- **PyTorch**: An open-source machine learning library for Python, used for a range of tasks including natural language processing and artificial intelligence.

### CUDA and cuDNN

- **CUDA 11.8**: Parallel computing platform and programming model.
- **cuDNN 11.8**: GPU-accelerated library for deep neural networks.

### RAPIDS

- **CUML and CUDF**: GPU-accelerated machine learning and data manipulation libraries.

---
## Features

### Basic Packages

- **v4l2loopback-dkms, build-essential, cmake, git, unzip, pkg-config**: Essential for general development.

### Computer Vision

- **OpenCV GPU Version**: High-performance computer vision library.
- **YOLOv5**: State-of-the-art object detection framework.
- **OpenPose GPU Version**: Real-time multi-person keypoint detection library for body, face, hands, and foot estimation.

### Machine Learning

- **scikit-learn, DLIB, face_recognition**: Popular machine learning libraries.
- **TensorFlow**: Open-source platform for machine learning.
- **PyTorch**: An open-source machine learning library for Python, used for a range of tasks including natural language processing and artificial intelligence.

### CUDA and cuDNN

- **CUDA 11.8**: Parallel computing platform and programming model.
- **cuDNN 11.8**: GPU-accelerated library for deep neural networks.

### RAPIDS

- **CUML and CUDF**: GPU-accelerated machine learning and data manipulation libraries.

> **Note**: This toolkit also adds the `cls` command to your terminal, which can be used as an alternative to the `clear` command to clear the terminal screen.

---

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

---

**© 2024 Automa, Inc. All Rights Reserved.**
