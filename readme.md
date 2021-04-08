
# Simple docker container to run pyopenvdb on your system



## Building an image and running your container

- Build an image with name ```pyopenvdb```:
```
docker build -t pyopenvdb_img .
```
- Use the image to run a container named ```test``` continuously and start a bash:
```
docker run -it --rm pyopenvdb_img bash
```
Now you can start ```python3.7``` and import ```pyopenvdb_img``` and start playing.
- If you want to use files on your local host machine, you can link a volume into the container when you start it:
```
docker run -it --rm -v <absolute path to a folder with scripts>:/scripts pyopenvdb_img bash
```
Here ```-it``` keeps the container running so you can work in it and ```-rm``` removes the container when you exit. With ```-v <abs local path>:<abs container path>``` you mount a folder on the host machine into the container so you can access it. The paths need to be absolute paths. Next ```pyopenvdb_img``` is the name of the image we previously build and ```bash``` indicates you want to start a terminal to work in.
- Now you can do ```cd /scripts``` to go to the mounted volume and start working with your scripts.


## When you need more python packages in your container
For this you will need to alter the ```Dockerfile``` . Under the header ```INSTALLING PYTHON PACKAGES``` add the python packages you need to install with ```pip3.7```. Build the image again so that it contains the packages you need.




