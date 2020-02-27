#!/bin/bash

echo app > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo "******* SCP file *******"
scp /tmp/.auth docker@192.168.99.100:/tmp/.auth
scp ./jenkins/deploy/publish.sh docker@192.168.99.100:/tmp/publish

echo "****** Exec Publish RH ******"
ssh docker@192.168.99.100 /tmp/publish
