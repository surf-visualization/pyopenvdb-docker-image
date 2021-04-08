FROM ubuntu:20.04

WORKDIR /root

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
    python3.7 get-pip.py && \
    rm -rf /root/get-pip.py && \
    apt install libpython3.7

##################################
# INSTALLING PYTHON PACKAGES
##################################
# install pyopenvdb
RUN pip3.7 install pyopenvdb; \
    pip3.7 install Pillow;

##################################
# ENVIRONMENT
##################################
ENV LD_LIBRARY_PATH /usr/local/lib/python3.7/dist-packages
RUN echo 'export LD_LIBRARY_PATH="/usr/local/lib/python3.7/dist-packages"' >> ~/.bashrc

##################################
# COPYING FILES TO YOUR CONTAINER
##################################
COPY mummy/genvdb.py /root/genvdb.py
COPY mummy/mkmummyvdb.py /root/mkmummyvdb.py
COPY mummy/data_basics_importing_data_mummy-slices.tar.gz /root/data_basics_importing_data_mummy-slices.tar.gz

##################################
# RUNNING SCRIPTS
##################################
CMD ["python3.7", "mkmummyvdb.py"]