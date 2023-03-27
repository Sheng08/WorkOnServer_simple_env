#!/bin/bash

USER=`whoami`
UserHome=~/
ImageName=dl_env
ContainerName=$ImageName"_"$USER
JupyterPort=8888

dockerfile_path=$(dirname $0)

echo ------- $ContainerName -------
echo UserName=$USER
echo UID=$(id -u)

if [ $# -eq 0 ]; then
	docker start -ia $ContainerName
else
	if [ $1 == '--new' ]; then # create new container

		read -sp 'Set user password: ' USERPWD

		docker build --build-arg UID=$(id -u) \
					 --build-arg UserName=$USER \
					 --build-arg UserPWD=$USERPWD\
					 -t $ImageName:$USER $dockerfile_path

		docker run -it \
				   -p $JupyterPort:$JupyterPort \
				   --gpus all \
				   --name $ContainerName \
				   --mount type=bind,source=$UserHome,target=/home/$USER \
				   --shm-size="50gb" \
				   $ImageName:$USER bash
	fi
fi
