#!/bin/bash  


echo -n "Enter the scenarios number you want to test > "
read scenarios


if [ $scenarios = 1 ] ; then
    # pre-condition 


    aws autoscaling create-auto-scaling-group --auto-scaling-group-name my-auto-scaling-group --launch-configuration-name my-launch-config --min-size 1 --max-size 3 --vpc-zone-identifier subnet-41767929c

    aws autoscaling put-scheduled-update-group-action --auto-scaling-group-name my-auto-scaling-group --scheduled-action-name my-scheduled-action --start-time "2014-05-12T08:00:00Z" --end-time "2014-05-12T08:00:00Z" --min-size 2 --max-size 6 --desired-capacity 4



    # fault inject (you need to find out the what is the instance-id you have created)

    

    # fault happen 
    
    aws autoscaling put-scheduled-update-group-action --auto-scaling-group-name my-auto-scaling-group --scheduled-action-name my-scheduled-action --start-time "2014-05-12T08:00:00Z" --end-time "2014-05-12T08:00:00Z" --min-size 2 --max-size 6 --desired-capacity 4


fi 