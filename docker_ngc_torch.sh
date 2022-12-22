#/bin/bash
#--device=/dev/video0
export MY_CONTAINER="XIAOQI_OFFICIAL_TORCH_2207_UBUNTU18.04"
num=`docker ps -a|grep "$MY_CONTAINER"|wc -l`
if [ 0 -eq $num ];then
docker run  -e DISPLAY=unix$DISPLAY  \
    --net=host --pid=host -v /sys/kernel/debug:/sys/kernel/debug -v /tmp/.X11-unix:/tmp/.X11-unix \
    -dit --privileged --name $MY_CONTAINER  \
    -v /home/xiaoqi/:/home/xiaoqi/ \
    -v /mnt/:/mnt/ \
    -v /tools/:/tools/ \
	  -v /data/:/data/ \
   	-v /projs/AE/xiaoqi/:/projs/AE/xiaoqi \
    --gpus all \
    -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
    -e NVIDIA_VISIBLE_DEVICES=all \
    nvcr.io/nvidia/pytorch:21.02-py3 /bin/bash
else
docker start $MY_CONTAINER
docker exec --use-nas-user --workdir=/projs/AE/xiaoqi -ti $MY_CONTAINER /bin/bash
#docker exec -ti $MY_CONTAINER /bin/bash
fi

