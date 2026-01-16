#bin/bash 
#Simple bash script to run alpine image using docker 

set -e
echo "Pulling alpine image from Docker website" 
docker pull alpine

echo "Listing Alpine container"
docker ps -a

echo  "Starting alpine container"
docker start alpine

echo "Executing alpine container" 
docker exec -it alpine

