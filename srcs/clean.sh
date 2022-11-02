#!/bin/sh

sudo docker stop $(sudo docker ps -qa); 
sudo docker rm $(sudo docker ps -qa);
sudo docker rmi -f $(sudo docker images -qa); 
sudo docker volume rm $(sudo docker volume ls -q);

sudo rm -rf /home/junyopar/data/db/*
sudo rm -rf /home/junyopar/data/wordpress/*

