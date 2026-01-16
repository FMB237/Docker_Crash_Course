# This is mainly the file Created for me Docker Crash Course

# Installtions
On windows we can download the executable file directly from the docker website 
Installing on linux we a set of commands for this course i have already set up a some installation commands  you will find into course

# What will this course cover or do ??
1.Running Containers with docker ?
2.Making image with a Dockerfile: So we gonna Learn how to write docker files on our own like a real devops engineer
3.Running Containers with docker compose
4.Learn common docker commands


# To start what is Docker ??
Docker is a software that permit us to run applications and even whole system inside a rebuild enviroment that 
enviroment is mainly call a container also note docker is an opensource software You can file a better definition of the terms on the internet 

# Contaienr and Container Image

Container: A lightweight, isolated, and executable software package that contains everything needed to run an application. 
Unlike a traditional virtual machine (VM), containers share the host operating system's kernel, making them much more efficient and faster to start up.

Image: A read-only template or blueprint used to create a container. Images are built from instructions in a simple text file called a Dockerfile.

Docker has a alot of commands and to get this commands using the Command Docker Help
 

# Let try to run existing docker images
To pull a docker image we use  the command "docker pull <filename>"
To remove we used the command "docker rm <filename>"
To start we used the command "docker start <filename>"
To run we used the command "docker run <filename>"


# Example docker pull alpine:latest, docker pull ubuntu 
The same applies for removing and running containers

To list all our existing container we used the command "docker ps -a"
Note :Each container has a name and a specific id 

# If a conatiner had been pull form docker-website it means we have download the image
So using Docker run we can now run multilple of this container like running mainly alpine or ubuntu containers with differcent names and Ids.

# To enter we used the commands docker exec -it apline /bin/sh 
This will create an interactive terminal that will permit us to access the container   

# Now learn how to a Web server in node js or expressjs or even any other languages
So let create a simple file name as index.js or app.js to run a simple web server on port 3000 on our pc 

# Or we can create a docker image for our nodejs server or Even pull this image from the original website using 

docker pull node 
After that let create a dockerfile with our own configurations to run a particualar container
So let build our docker file 
Let modifie the dockerfile from the course resources and build our  personalise dockerfile server for our machine
SO to used this docker config we gonna used the scripts
# docker build -t demo .
Where demo is the name of the container
After the images building we gonna used the run the container using it id 
check the docker container with docker ps -a
After running the server from the map the container port server to our host machine so that we can the a proffesional case where we are doing a port
This can be done using the command
# docker run -p 3000:3000 demo 
and  check that with curl http://localhost:3000

#  Now  let create docker-compose.yml file 
docker-compose files are mainly known as multiple stage docker files
So in the type of docker file we can run multiple intruction

In modern web developper app are been deploy in containers to correct dependencies problems
Also we large app that need Fronend,Backend and Database for delpoyement a docker-compose file is been written and build
In other to run the 3 services at the same time in 3 differcent container that communicate with each other since the are run into the same network.

# Let run a single stage dockerfile 
let create a single-stage dockerfile in which we gonna install gcc which is a C programming languages compile and text it with reel apps .
What is a single-stage ?
A single-stage docker file is a file that contains only a single set of instructions 
Like the gcc container i have make in the Dockerfile-single 

# Let  build a Multiple stage file
By mutiple stage we are mainly talking about docker-compose.yml files  which execute many services so many stage inside the same file 


# Running mutiple video using docker-compose
As explain with docker-compose we provide all this stage in a single file 
like Frontend,backend,database and even webserver
Make sure docker-compose is install and enable on your machine 
To run a docker-compose file we used the command

# docker-compose -d up  and to close it we used docker-compose down

Let just build a small docker-compose file
With this is mainly the end of my Docker-crash course
