FROM ubuntu:20.04

#WORKDIR /root

##################################
# INSTALLING OS AND BASIC DEPENDENCIES
##################################
# update ubuntu and install basic dependencies
RUN apt update && \
    apt install -y \
        python3-dev \
        software-properties-common

# install python3.7 and pip
ADD https://bootstrap.pypa.io/get-pip.py get-pip.py
RUN add-apt-repository -y ppa:deadsnakes/ppa && \
    apt update && \
    apt install -y python3.7 && \
    apt install -y python3.7-distutils && \
    python3.7 get-pip.py && \
    rm -rf /root/get-pip.py && \
    apt install libpython3.7

##################################
# INSTALLING PYTHON PACKAGES
##################################
# install pyopenvdb
RUN pip3.7 install pyopenvdb; \
    #pip3.7 install <your package>; \
    pip3.7 install Pillow; \
    pip3.7 install scipy; \
    pip3.7 install pandas;


##################################
# ENVIRONMENT
##################################
ENV LD_LIBRARY_PATH /usr/local/lib/python3.7/dist-packages
RUN echo 'export LD_LIBRARY_PATH="/usr/local/lib/python3.7/dist-packages"' >> ~/.bashrc

