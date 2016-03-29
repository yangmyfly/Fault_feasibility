#!/bin/bash  


echo -n "Enter the scenarios number you want to test > "
read scenarios


if [ $scenarios = 1 ] ; then
    # pre-condition 

    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --image-id ami-c6169af6 --instance-type m1.medium

    aws autoscaling create-auto-scaling-group --auto-scaling-group-name my-auto-scaling-group --launch-configuration-name my-launch-config --min-size 1 --max-size 3 --vpc-zone-identifier subnet-41767929c
    # fault happen 
    aws autoscaling delete-launch-configuration --launch-configuration-name my-launch-config

    