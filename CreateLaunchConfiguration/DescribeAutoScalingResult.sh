#!/bin/bash  


echo -n "Enter the scenarios number you want to test > "
read scenarios


if [ $scenarios = 1 ] ; then
    # pre-condition 


    aws autoscaling create-auto-scaling-group --auto-scaling-group-name my-auto-scaling-group --launch-configuration-name my-launch-config --min-size 1 --max-size 3 --vpc-zone-identifier subnet-41767929c



    # fault inject (you need to find out the what is the instance-id you have created)

    aws autoscaling delete-auto-scaling-group --auto-scaling-group-name my-auto-scaling-group --force-delete

    # fault happen 
    
    aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name my-auto-scaling-group





fi 