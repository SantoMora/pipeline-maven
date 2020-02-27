#!/bin/bash

#Copiar jar
cp -f java-app/target/*.jar jenkins/build/

echo "##################"
echo "# Building Image #"
echo "##################" 

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
