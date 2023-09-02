#!/bin/bash

echo "-------------------------------------------"
echo "Starting the setup..."
echo "-------------------------------------------"

# Basics
echo "Installing Basic Packages..."
sudo apt-get update
sudo apt-get install -y v4l2loopback-dkms build-essential cmake git unzip pkg-config libjpeg-dev libtiff5-dev libjasper-dev libpng-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran python3-dev libopencv-dev libfreeimage-dev protobuf-compiler libavutil-dev
sudo apt-get install -y libavdevice-dev libavfilter-dev libavformat-dev libavcodec-dev libswresample-dev libswscale-dev libopenblas-dev libgtk-3-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libeigen3-dev libtesseract-dev
sudo apt-get install -y libgoogle-glog-dev libboost-thread-dev libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev python3-numpy python3-pip libboost-all-dev python3-tk libhdf5-dev libatlas-base-dev

echo "-------------------------------------------"
echo "Installed Basic Packages."
echo "-------------------------------------------"

# YOLOv5 and OpenCV uninstall
echo "Installing YOLOv5 and uninstalling OpenCV Python..."
pip install yolov5
pip uninstall -y opencv-python

echo "-------------------------------------------"
echo "Installed YOLOv5 and uninstalled OpenCV Python."
echo "-------------------------------------------"

# CUDA 11.8
echo "Installing CUDA 11.8..."
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

# CUDNN 11.8
echo "Installing CUDNN 11.8..."
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
echo "Installed CUDNN 11.8."
echo "-------------------------------------------"

# Add to .bashrc
echo "Adding environment variables to .bashrc..."
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$CUDA_HOME/extras/CUPTI/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'alias cls="printf \"\033c\""' >> ~/.bashrc
echo 'export MPLCONFIGDIR=~/mpl_config' >> ~/.bashrc
source ~/.bashrc

echo "-------------------------------------------"
echo "Added environment variables to .bashrc."
echo "-------------------------------------------"

# Microconda
echo "Installing Microconda..."
sudo apt-get install wget
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh
sh ./Miniconda3-py39_4.12.0-Linux-x86_64.sh
conda config --set auto_activate_base false

echo "-------------------------------------------"
echo "Installed Microconda."
echo "-------------------------------------------"

# Other pip installs
echo "Installing scikit-learn, DLIB, and face_recognition..."
pip install scikit-learn
pip install dlib --verbose
pip install face_recognition
pip install tensorflow

echo "-------------------------------------------"
echo "Installed scikit-learn, DLIB, and face_recognition."
echo "-------------------------------------------"

# CUML AND CUDF
echo "Installing CUML and CUDF..."
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


# OPENCV-GPU
echo "Attempting to Install OpenCV GPU Version..."
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
      ..

make -j$(nproc)

sudo make install
sudo ldconfig
cd

echo "-------------------------------------------"
echo "Installed OpenCV GPU Version."
echo "-------------------------------------------"

# OPENPOSE GPU
echo "Attempting to Install OpenPose GPU Version..."
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

echo "Script finished."
echo "-------------------------------------------"
