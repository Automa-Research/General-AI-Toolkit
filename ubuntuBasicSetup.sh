#!/bin/bash

echo "-------------------------------------------"
echo "Starting the setup..."
echo "-------------------------------------------"

# Basics
echo "-------------------------------------------------------"
echo "Installing Basic Packages... This Might Take A While"
echo "-------------------------------------------------------"
sudo apt-get update
sudo apt-get install -y v4l2loopback-dkms build-essential cmake git unzip pkg-config libjpeg-dev libtiff5-dev libpng-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran python3-dev libopencv-dev libfreeimage-dev protobuf-compiler libavutil-dev
sudo apt-get install -y libavdevice-dev libavfilter-dev libavformat-dev libavcodec-dev libswresample-dev libswscale-dev libopenblas-dev libgtk-3-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libeigen3-dev libtesseract-dev
sudo apt-get install -y libgoogle-glog-dev libboost-thread-dev libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev python3-numpy python3-pip libboost-all-dev python3-tk libhdf5-dev libatlas-base-dev

echo "-------------------------------------------"
echo "Installed Basic Packages."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing YOLOv5 and PyTorch."
echo "-------------------------------------------"

# YOLOv5 and OpenCV uninstall
pip install yolov5
pip uninstall -y opencv-python

echo "-------------------------------------------"
echo "Installed YOLOv5 and PyTorch."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing CUDA 11.8."
echo "-------------------------------------------"

# CUDA 11.8
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu2204-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

echo "-------------------------------------------"
echo "Installed CUDA 11.8."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing cuDNN for CUDA 11.8."
echo "-------------------------------------------"

# CUDNN 11.8
echo "Trying to download CUDNN v8.9.4.25_1.0-1_amd64 automatically"

# Google Drive File ID and Destination Filename
FILE_ID="1xayO_mnGQuQUWrKm1_jXmbXpdW97qi6t"
DESTINATION="cudnn-local-repo-ubuntu2204-8.9.4.25_1.0-1_amd64.deb"

# Fetch the confirmation token and store it in a variable
CONFIRM=$(curl -sc /tmp/gcookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" | grep -o 'confirm=[^&]*' | sed 's/confirm=//')

# Use wget to download the file using the confirmation token and cookies
wget --load-cookies /tmp/gcookie "https://drive.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILE_ID}" -O ${DESTINATION}

# Check if wget was successful
if [ $? -eq 0 ]; then
  echo "Downloaded! Proceeding with installation."
else
  echo "Failed! You'll need to download cudnn-local-repo-ubuntu2204-8.9.4.25_1.0-1_amd64.deb manually from NVIDIA's website"
  echo "Press ENTER to continue the script (Once cuDNN is downloaded and placed into the folder)"
  read -p ""
fi

# Clean up the cookie file
rm -f /tmp/gcookie

sudo dpkg -i cudnn-local-repo-ubuntu2204-8.9.4.25_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-*/cudnn-local-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get install libcudnn8=8.9.4.25-1+cuda11.8
sudo apt-get install libcudnn8-dev=8.9.4.25-1+cuda11.8
sudo apt-get install libcudnn8-samples=8.9.4.25-1+cuda11.8
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"
sudo apt-get update
sudo apt-get install libcudnn8=8.9.4.25-1+cuda11.8
sudo apt-get install libcudnn8-dev=8.9.4.25-1+cuda11.8
cd /usr/src/cudnn_samples_v8/mnistCUDNN
sudo make clean && sudo make
cd

echo "-------------------------------------------"
echo "Installed cuDNN."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Adding environment variables to .bashrc."
echo "-------------------------------------------"

# Add to .bashrc
cat <<EOL >> ~/.bashrc
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=\$CUDA_HOME/lib64:\$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=\$CUDA_HOME/extras/CUPTI/lib64:\$LD_LIBRARY_PATH
export PATH=/usr/local/cuda-11.8/bin:\$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64:\$LD_LIBRARY_PATH
export PATH="/usr/local/cuda-11.8/bin:\$PATH"
export PATH="/usr/local/cuda-11.8/libnvvp:\$PATH"
export PATH="usr/local/cuda-11.8/extras/CUPTI:\$PATH"
alias cls="printf \"\033c\""
export MPLCONFIGDIR=~/mpl_config
EOL
source ~/.bashrc

echo "-------------------------------------------"
echo "Added environment variables to .bashrc."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing Microconda."
echo "-------------------------------------------"

# Microconda
sudo apt-get install wget
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh
sh ./Miniconda3-py39_4.12.0-Linux-x86_64.sh
conda config --set auto_activate_base false

echo "-------------------------------------------"
echo "Installed Microconda."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing scikit-learn, TensorFlow, DLIB, and face_recognition."
echo "-------------------------------------------"

# Other pip installs
pip install scikit-learn
pip install dlib --verbose
pip install face_recognition
pip install tensorflow
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

echo "-------------------------------------------"
echo "Installed scikit-learn, TensorFlow, DLIB, and face_recognition."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing CUML and CUDF."
echo "-------------------------------------------"

# CUML AND CUDF
conda install -c rapidsai -c conda-forge -c nvidia  cudf=23.04 cuml=23.04 python=3.10 cudatoolkit=11.8
pip install cudf-cu11 dask-cudf-cu11 --extra-index-url=https://pypi.nvidia.com
pip install cuml-cu11 --extra-index-url=https://pypi.nvidia.com
pip install cugraph-cu11 --extra-index-url=https://pypi.nvidia.com

echo "-------------------------------------------"
echo "Installed CUML and CUDF."
echo "-------------------------------------------"

# Hold packages
echo "Holding some packages to prevent unwanted updates..."
sudo apt-mark hold libcudnn8 libcudnn8-dev libnvidia-compute-530

echo "-------------------------------------------"
echo "Held packages."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing Nvidia Video Codec SDK."
echo "-------------------------------------------"

# Google Drive File ID and Destination Filename
FILE_ID="1BL-g_ytLr2yxGQyVqaCE7qu3PfLrjfTJ"
DESTINATION="Video_Codec_SDK_12.1.14.zip"

# Fetch the confirmation token and store it in a variable
CONFIRM=$(curl -sc /tmp/gcookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" | grep -o 'confirm=[^&]*' | sed 's/confirm=//')

# Use wget to download the file using the confirmation token and cookies
wget --load-cookies /tmp/gcookie "https://drive.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILE_ID}" -O ${DESTINATION}

# Check if wget was successful
if [ $? -eq 0 ]; then
  echo "Download successful! Proceeding with extraction and setup."
  # Proceed with unzipping and setting up the SDK
  unzip ${DESTINATION} -d Video_Codec_SDK
  cd Video_Codec_SDK/Video_Codec_SDK_12.1.14
  sudo cp Interface/*.h /usr/local/cuda/include/
  sudo cp Lib/linux/stubs/x86_64/*.so /usr/local/cuda/lib64/stubs/
else
  echo "Failed to download. Please check the link or manually download the SDK."
fi

# Clean up the cookie file
rm -f /tmp/gcookie
cd

VIDEO_CODEC_SDK_PATH="~/Video_Codec_SDK/Video_Codec_SDK_*"

nvcuvid_path=$(find /usr/local -name 'libnvcuvid.so' 2>/dev/null | head -n 1)
nvidia_encode_path=$(find /usr/local -name 'libnvidia-encode.so' 2>/dev/null | head -n 1)

if [[ -z "$nvcuvid_path" ]]; then
  echo "libnvcuvid.so not found in /usr/local. Attempting to use the Video Codec SDK stub..."
  nvcuvid_path=$(find $VIDEO_CODEC_SDK_PATH -name 'libnvcuvid.so' 2>/dev/null | head -n 1)
fi

if [[ -z "$nvidia_encode_path" ]]; then
  echo "libnvidia-encode.so not found in /usr/local. Attempting to use the Video Codec SDK stub..."
  nvidia_encode_path=$(find $VIDEO_CODEC_SDK_PATH -name 'libnvidia-encode.so' 2>/dev/null | head -n 1)
fi

if [[ -z "$nvcuvid_path" ]]; then
  echo "libnvcuvid.so could not be found. Please install the NVIDIA Video Codec SDK manually."
  exit 1
fi

if [[ -z "$nvidia_encode_path" ]]; then
  echo "libnvidia-encode.so could not be found. Please install the NVIDIA Video Codec SDK manually."
  exit 1
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(dirname $nvcuvid_path)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(dirname $nvidia_encode_path)

source ~/.bashrc

sudo ln -s $nvcuvid_path /usr/local/lib/libnvcuvid.so.1
sudo ln -s $nvidia_encode_path /usr/local/lib/libnvidia-encode.so.1
sudo ldconfig

echo "-------------------------------------------"
echo "Installed Nvidia Video Codec SDK."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing OpenCv GPU"
echo "-------------------------------------------"

# OPENCV-GPU
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

mkdir opencv/build
cd opencv/build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
      -D WITH_CUDA=ON \
      -D WITH_CUBLAS=ON \
      -D ENABLE_FAST_MATH=1 \
      -D CUDA_FAST_MATH=1 \
      -D WITH_CUDNN=ON \
      -D OPENCV_DNN_CUDA=ON \
      -D CUDA_ARCH_BIN=8.6 \
      -D BUILD_EXAMPLES=OFF \
      -D BUILD_DOCS=OFF \
      -D BUILD_PERF_TESTS=OFF \
      -D BUILD_TESTS=OFF \
      -D BUILD_opencv_python3=ON \
      -D opencv_dnn_superres=ON \
      -D WITH_NVCUVID=ON \
      -D CUDA_nvcuvid_LIBRARY="$nvcuvid_path" \
      -D WITH_NVCUVENC=ON \
      -D CUDA_nvidia-encode_LIBRARY="$nvidia_encode_path" \
      ..

make -j$(nproc)

sudo make install
sudo ldconfig
cd

echo "-------------------------------------------"
echo "Installed OpenCV GPU Version."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Installing OpenPose GPU Version."
echo "-------------------------------------------"

# OPENPOSE GPU
git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose
cd openpose/
git submodule update --init --recursive --remote

mkdir build/
cd build/

cmake -DUSE_CUDNN=OFF -DBUILD_PYTHON=ON ..

make -j`nproc`
sudo make install
cd

echo "-------------------------------------------"
echo "Installed OpenPose GPU Version."
echo "-------------------------------------------"

echo "-------------------------------------------"
echo "Script finished."
echo "-------------------------------------------"
