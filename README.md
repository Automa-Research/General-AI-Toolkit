# General AI Toolkit Installation Guide

<p align="center">
  <img src="https://community.nasscom.in/sites/default/files/styles/960_x_600/public/media/images/learn%20ai.jpg?itok=oxkFTb_W" alt="General AI Toolkit Logo" width="320" height="200">
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
- NVIDIA GPU (Compute Capability 8.6)
- Internet connection

---

## Installation

To install the General AI Toolkit, simply run the provided installation script. This script will install a plethora of essential packages, libraries, and frameworks, including but not limited to CUDA 11.8, cuDNN 11.8, YOLOv5, OpenCV, and many more.

```bash
git clone https://github.com/Automa-Research/General-AI-Toolkit.git
cd General-AI-Toolkit
sudo chmod +x ubuntuBasicSetup.sh
sudo bash ubuntuBasicSetup.sh 
```

> **Note**: After installation and restarting the terminal, you might want to disable Conda's auto-activation feature. To do so, restart the terminal and run the following command:
>
> ```bash
> conda config --set auto_activate_base false
> ```
> This will prevent Conda from automatically activating its base environment every time you open a new terminal session.

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

### CUDA and cuDNN

- **CUDA 11.8**: Parallel computing platform and programming model.
- **cuDNN 11.8**: GPU-accelerated library for deep neural networks.

### RAPIDS

- **CUML and CUDF**: GPU-accelerated machine learning and data manipulation libraries.

---

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

**© 2023 General AI Toolkit, Inc. All Rights Reserved.**
