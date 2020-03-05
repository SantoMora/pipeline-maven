#!/bin/bash

echo "############################"
echo "**** Preparing to push ****"
echo "############################" 

REGISTRY="localhost:5043"
IMAGE="app"
MOUNT="Mount/image.tar"


echo "*** Saving Image ***"
docker save -o ~/$MOUNT $IMAGE
echo "*** Loading image ***"
ssh docker@192.168.99.100 "docker load -i ~/$MOUNT && 
    echo '*** Tagging image ***' &&
    docker tag $IMAGE:$BUILD_TAG $REGISTRY/$IMAGE:$BUILD_TAG &&
    echo '*** Pushing image ***' &&
    docker push $REGISTRY/$IMAGE:$BUILD_TAG" 
