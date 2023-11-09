==============================================Important Docker Commands======================================================================================================

============================================== Docker Images and Containers Basic ===============================================================================

docker image ls ---- list all images
docker image pull hello-world:latest ---- get image with specified tag if tag is not specified it will pull latest by default
docker image rm hello-world --- remove image
docker image history <id> ---history of image
docker version --- info about docker client and server
docker info --- docker information
docker image inspect hello-world --- image info
sudo usermod -aG docker <username> --- adds user to docker group so that we dont have to use sudo everytime
docker container ls -- list all running containers
docker container ls -a -- list all containers 
docker container create hello-world --create a container but this is not running
docker container start <id> ---- start container
docker container run hello-world ---- start container and start it shows output as well
docker container rm ---- remove container 
docker container run -it ubuntu -- interact with container
docker container logs <id> --prints logs of container
docker container stop <id> -- exit container
docker container run -itd  ubuntu  --- d means daemon starts container in background
docker container attach <id> -- main process will get attached and when it exits main process exits
docker container exec -it <id> command -- executes commands under container
docker image rm <id> --force --- image gets untagged but not deleted
docker container stop <id> --stop container
docker container rm <id>  -- remove image only if its stopped
docker container rm <id> --force  -- stops and remove container
docker container rm --force $(docker container ls -a -q) --delete all containers in system
docker image prune -- deletes dangling images
docker image prune -a --deletes all images which dont have containers assosiated with it
docker container ls -a -q -- list all quite containers
docker container itd --name myname --change name of container
docker container run -itd --name mycontainer2 -h mycontiner2 ubuntu:18.04 --chnage name and hostname
docker container run -itd --name mycontainer2 -p 8080:80 httpd  --port forwarding
ifconfig/ ip -br -a --- to get ip of machine
docker system prune -a - delete all images and containers 
docker system prune -- stooped containers , images dangling images

=============================================== Docker Networks ===============================================================================

bridge is default network driver, other n/w drivers are host n/w, none and custom n/w
******** bridge n/w creates different ip for each container and host network binds same ip to each contaoner so process isolation is not achieved in host n/w.
None is used when you dont want to have any network configuration attached to container similr to host but isolation is achieved ******************

docker network ls --list networks on host
docker network inspect <id> --more info of network
docker network create mynet-1 --create a new network
docker container run -itd --name ws1 --network mynet-1 httpd -- will create container on specified n/w
docker network disconnect bridge client -- disconnect network from container
docker network connect mynet-1 client -- connect n/w to container
docker network create --subnet 172.30.0.0/24 --gateway 172.30.0.1 mynet-2 ---n/w iwth subnet and gateway
docker network rm mynet-2 --delete network if attched to any container disconnect it first.force doesnt work here 

================================================== Docker Volumes ===============================================================================

All Containers are immetuble. Containres can not store data. data is stored only till container exists because of local storage.
docker provide storage in three ways Local(Default), Persistent, static image storage
Storage Divers - Overlay2 (Perffered), Aufs, Devicemappers, Btrfs and Zfs, Vfs all of these are UnionFS
Persistent Data Storage - volumes provide persistent storage, allows sharing data among storage, gets created outside of container so can be accessed using docker cli.
types of persistent storage are volumes, bindmounts and Tmpfs mount(temprary so not preffered)
                   
docker volume ls --list all volumes
docker volume create my-vol -- to create volume 
docker volume inspect my-vol -info of volume return Mountpoint where data is stored
docker volume rm <vol-name> --delete volume

docker container run -itd --name test -v my-vol:/app ubuntu -- -v for assgning volume, app folder will be created inside container to store data even if we delete this container data persists in volume attached
docker container exec -it test bash 
echo "welcome" > test.txt
cd /app
ls  -- you can find a file test.txt here
exit
docker container rm test --force

docker container run -itd --name test -v my-vol:/myapp ubuntu
docker container exec -it test bash 
cd /myapp
ls -- here file will still exist as its stored in storage

sudo -i
cd var/lib/docker/volumes/<volume-name>/_data# ls --location of volume if you create a file here it will be also available to all containers

docker container run -itd --name mydb -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 mysql:5.7  -- -e for env variable createing container for mysql db

*** chnaging location of volumes: BIND MOUNTS*****

mkdir website
ls website/
vim index.html
	<h1>Hello</h1>
	press - ESC type -:wq
cd ..
docker container run -itd --name ws1 -p 8080:80 httpd  --this command run apache server i.e. httpd in a container which uses /usr/local/apache2/htdocs/ as volume by default see httpd documentation on docker hub for information
docker container run -itd --name ws2 -p 9090:80 -v home/hemantpatil/website:/usr/local/apache2/htdocs/ httpd -- now we are running same command but we are overriding default volume of httpd this is called as mount binding

============================================================= Docker Images Advanced (Using Docker files) ===================================================================================

*************Example 1 ************************************
mkdir website
ls website/
vim index.html
	<h1>Hello</h1>
	press - ESC type -:wq
vim Dockerfile
	#Base Image
	FROM ubuntu:18.04
	
	#Update the apt-cache
	#execute the command at time of building a image
	RUN apt-get update
	
	#install apache2 webserver
	RUN apt-get install -y apache2
	
	#copy indix.html from website to server directory
	COPY index.html /var/www/html/
	
	#expose port 80 for listening requests
	EXPOSE 80
	
	#Run apache in foreground when container starts (ENTRYPOINT/CMD)
	ENTRYPOINT apachectl -D FOREGROUND
	
	press - ESC type -:wq

docker image build -t mywebsite:v1 . -- v1 is version specified if not specifile latest will be considered and . means dockerfile context - will be found in root folder itself
docker container run -itd -p 8080:80 --name website mywebsite:v1 --- if v1 is not specified it will try to find it on dockerhub container should start after this command
curl http://localhost:8080 ---should give expected restult

********************Example 2(Multi Stage Build) its a advance exapmle if you dont understand its fine*********************************
mkdir application
cd application/
vim Main.java
	public class Main{
		public static void main(String args[])
		{
			System.out.println("Hello World");
		}
	}
	press - ESC type -:wq
	
javac Main.java ---- as java is not installed on our machine we get gt a error

vim Dockerfile
	#############Stage 0: Building Application ###################
	#Base Image
	FROM openjdk:8	
	#set Working Dir
	WORKDIR /app
	#Copy Main.java
	copy Main.java .
	#Compile Application
	RUN javac Main.java
	
	###############Stage 1: Running Apllication and minimizing resourses ###################
	#Base
	From alpine
	#set Working Dir
	WORKDIR /app
	#install jre
	RUN apk update && apk add openjdk8-jre
	#copy the main class (not java file) this will bw copied from stage 0
	COPY --from=0 /app/Main.class .
	
	######################Actually running application ##################################
	#Run Application(Actually)
	CMD java Main

	press - ESC type -:wq

docker image build -t my-java-app .
docker container run --rm my-java-app   --- --rm will delete temporary container so its purpose is fulfilled.


Important to not that if you remove Stage 1 and run this project it will run successfully but the image size will be around 600 MB. adding staging with alpine removes resourses from Stage 0 and image sixe will be around 100MB
So, Everytime you use staging previous staging resourses gets discarded and image will only contain resourses from last stage FROM is variable which defines start of Stage. 

####Sharing Images #############
docker image tag <image name> <docker hub user name>/<image name>
docker login
Username:<docker hub user name>
Password:<docker hub password>
docker image push <docker hub user name>/<image name> --newly created images name as it is this will push command to docker hub and others can able to pull it

docker image save <image name> > <location to save>/<name>.tar   --exporting image locally this is not recommended 
doker image import <name>  --importing local image
