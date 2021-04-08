
# Simple docker container to run pyopenvdb on your system



## Preparing the docker file for your script

You will need to alter the ```Dockerfile``` so that you script, files and packages are included in the container:
- Under the header ```INSTALLING PYTHON PACKAGES``` add the python packages to install with ```pip```.
- Under ```COPYING FILES TO YOUR CONTAINER``` add the files and scripts you need to run in your container.
- Last under ```RUNNING SCRIPTS``` add the scripts you want to run.


## To run the container
- First we build our container (do this in the directory where ```Dockerfile``` is located):
```
docker build .
```
- The building can take a minute or more. It will output as a last line something like this:
```
=> => writing image sha256:fd2ffb251e12fca61e7274595255c897d97692209c9bd24e326f1de4266119fb
```
- Copy the code starting with ```sha``` for the next command to run the container:
```
docker run --name test <code from build>
```
- Now you can copy any output from you scripts to your local file system using:
```
docker cp <container name>:<your outputfile> <path on your local machine>
```
If you named your container ```test``` it looks like this:
```
docker cp test:<your outputfile> <path on your local machine>
```
- When you are done with your container you can remove it like this:
```
docker rm test
```
