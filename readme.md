
# Simple docker container to run pyopenvdb on your system

The goal of this dockerfile is simple. If you tried installing pyopenvdb through the given instructions (https://pypi.org/project/pyopenvdb/) and failed or if your system is not compatiple, try this dockerfile.

To run pyopenvdb through this dockerfile follow the instructions below. 

## Build and run pyopenvdb in your container
Download, install and start docker desktop (https://www.docker.com/products/docker-desktop).

Download ```Dockerfile``` from this repo or clone it to your machine and open a terminal at the directory where you saved ```Dockerfile```.

Now build an image (which will be named ```pyopenvdb_img```) by executing the following command:
```
docker build -t pyopenvdb_img .
```
Now you can run a bash terminal in a container with the image you just made using:
```
docker run -it --rm pyopenvdb_img bash
```
Here ```-it``` keeps the container running so you can work in it and ```-rm``` removes the container when you exit. 

Now you can type ```python3.7``` and import ```pyopenvdb``` and start playing. (Note that the image uses ```python3.7``` and not ```python``` or ```python3```. If you want other installs of python please edit the dockerfile and build again.)

If you want to use files on your machine in the container, you need to link a volume into the container when you start it. If your previous container is still running, exit it by typing ```exit```. Find the absolute path of the directory containing the files you want to use in the container and execute the following command:
```
docker run -it --rm -v <absolute path to a folder with scripts>:/scripts pyopenvdb_img bash
```
With ```-v <abs local path>:<abs container path>``` you mount the folder on the host machine into the container so you can access it. The paths need to be absolute paths. 

Now in your container you can do ```cd /scripts``` to go to the mounted volume and start working with your scripts.

## When you need more python packages in your container
For this you will need to alter the ```Dockerfile``` . Under the header ```INSTALLING PYTHON PACKAGES``` add the python packages you need to install with ```pip3.7```. Build the image again so that it contains the packages you need.




