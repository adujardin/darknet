FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04 AS builder

RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove -y && \
    ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    apt-get install --no-install-recommends wget less udev apt-transport-https nano usbutils git cmake libopencv-dev -y && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/AlexeyAB/darknet.git ; \
    cd darknet ; \
    mkdir build_cmake; cd build_cmake; cmake .. ; export LD_LIBRARY_PATH=LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda-10.0/compat/ ; make -j8


FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04 AS runtime

RUN apt-get update -y && apt-get autoremove -y && \
    apt-get install --no-install-recommends wget libopencv-core3.2 libopencv-imgcodecs3.2 libopencv-videoio3.2 libopencv-imgproc3.2 libopencv-highgui3.2 python3-pip libsm6 libxext6 libxrender-dev -y && \
    pip3 install opencv-python pillow && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /darknet/build_cmake/darknet /darknet/build_cmake/libdark.so /darknet/
WORKDIR /darknet
