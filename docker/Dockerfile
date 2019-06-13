FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-get update ; \
    ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime ; \
    apt-get install lsb-release wget less udev sudo apt-transport-https nano usbutils git cmake libopencv-dev -y ; \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

#RUN wget -O ZED_SDK_Linux_Ubuntu18.run https://download.stereolabs.com/zedsdk/2.8/ubuntu18 ; \
#    chmod +x ZED_SDK_Linux_Ubuntu18.run ; \
#    ./ZED_SDK_Linux_Ubuntu18.run silent ; \
#    rm ZED_SDK_Linux_Ubuntu18.run

RUN git clone https://github.com/AlexeyAB/darknet.git ; \
    cd darknet ; \
    mkdir build_cmake; cd build_cmake; cmake .. ; export LD_LIBRARY_PATH=LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda-10.0/compat/ ; make -j8