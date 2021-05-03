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

Here ```-it``` keeps the container running so you can work in it and ```--rm``` removes the container when you exit. 

Now you can type ```python3.7``` and import ```pyopenvdb``` and start playing. (Note that the image uses ```python3.7``` and not ```python``` or ```python3```.)

## Accessing files on the local machine

If you want to use files on your machine in the container, you need to link a volume into the container when you start it. If your previous container is still running, exit it by typing ```exit```. Find the absolute path of the directory containing the files you want to use in the container and execute the following command:

```
docker run -it --rm -v <absolute path to a folder with scripts>:/scripts pyopenvdb_img bash
```

With ```-v <abs local path>:<abs container path>``` you mount the folder on the host machine into the container so you can access it. The paths need to be absolute paths. 

Now in your container you can do ```cd /scripts``` to go to the mounted volume and start working with your scripts.

## Example

```
# Start the container, mount the current directory as /scripts within the container
$ docker run -it --rm -v `pwd`:/scripts pyopenvdb_img bash

# Inside the container, execute the script, which generates a VDB file

root@f91a245cb4e9:/# cd /scripts/

root@f91a245cb4e9:/scripts# ls -l
total 12
-rw-r--r-- 1 1000 users 1074 May  3 10:57 Dockerfile
-rw-r--r-- 1 1000 users  426 May  3 14:22 example.py
-rw-r--r-- 1 1000 users 1387 May  3 10:57 readme.md

root@f91a245cb4e9:/scripts# python3.7 example.py
Copying
((0, 0, 0), (49, 49, 49))
root@f91a245cb4e9:/scripts# ls -l
total 536
-rw-r--r-- 1 1000 users   1074 May  3 10:57 Dockerfile
-rw-r--r-- 1 1000 users    426 May  3 14:22 example.py
-rw-r--r-- 1 root root  532562 May  3 14:22 floats.vdb
-rw-r--r-- 1 1000 users   1387 May  3 10:57 readme.md

root@f91a245cb4e9:/scripts# exit

# Outside the container, now have the generated floats.vdb file
$ ls -l
total 536
-rw-r--r-- 1 melis users   1074 May  3 12:57 Dockerfile
-rw-r--r-- 1 melis users    426 May  3 16:22 example.py
-rw-r--r-- 1 root  root  532562 May  3 16:22 floats.vdb
-rw-r--r-- 1 melis users   1387 May  3 12:57 readme.md
```

## When you need more python packages in your container

For this you will need to alter the ```Dockerfile``` . Under the header ```# INSTALLING PYTHON PACKAGES``` add the python packages you need to install with ```pip3.7```. Build the image again so that it contains the packages you need.




