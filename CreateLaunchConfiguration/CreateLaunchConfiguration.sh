#!/bin/bash  


echo -n "Enter the scenarios number you want to test > "
read scenarios


if [ $scenarios = 1 ] ; then
    # pre-condition 

    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --image-id ami-c6169af6 --instance-type m1.medium --spot-price "0.50"

    # fault inject

    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --image-id ami-c6169af6 --instance-type m1.medium --spot-price "0.50"

elif [ $scenarios = 2 ] ; then
    # pre-condition 
    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --image-id ami-c6169af6 --instance-type m1.medium --spot-price "0.50"

    aws autoscaling delete-launch-configuration --launch-configuration-name my-launch-config

    # fault inject

    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --image-id ami-c6169af6 --instance-type m1.medium

elif [ $scenarios = 3]; then
    # pre-condition 
    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --image-id ami-c6169af6 --instance-type m1.medium --spot-price "0.50"

    aws autoscaling create-auto-scaling-group --auto-scaling-group-name my-auto-scaling-group --launch-configuration-name my-launch-config --min-size 1 --max-size 3 --vpc-zone-identifier subnet-41767929c

    aws autoscaling delete-launch-configuration --launch-configuration-name my-launch-config

    # delete some instance so that it can scale up

    

fi 


