
# Simple docker container to run pyopenvdb on your system

## Build and run pyopenvdb in your container
- Download, install and start docker desktop (https://www.docker.com/products/docker-desktop)

- Build an image with name ```pyopenvdb_img```:
```
docker build -t pyopenvdb_img .
```
- Use the image to run a container continuously and start a bash:
```
docker run -it --rm pyopenvdb_img bash
```
Here ```-it``` keeps the container running so you can work in it and ```-rm``` removes the container when you exit. Now you can type ```python3.7``` and import ```pyopenvdb``` and start playing.
- If you want to use files on your local host machine, you can link a volume into the container when you start it:
```
docker run -it --rm -v <absolute path to a folder with scripts>:/scripts pyopenvdb_img bash
```
With ```-v <abs local path>:<abs container path>``` you mount the folder on the host machine into the container so you can access it. The paths need to be absolute paths. 
- Now in your container you can do ```cd /scripts``` to go to the mounted volume and start working with your scripts.

## When you need more python packages in your container
For this you will need to alter the ```Dockerfile``` . Under the header ```INSTALLING PYTHON PACKAGES``` add the python packages you need to install with ```pip3.7```. Build the image again so that it contains the packages you need.




