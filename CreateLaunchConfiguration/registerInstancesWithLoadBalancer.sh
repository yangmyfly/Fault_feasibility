#!/bin/bash  


echo -n "Enter the scenarios number you want to test > "
read scenarios


if [ $scenarios = 1 ] ; then
    # pre-condition 


    aws autoscaling create-auto-scaling-group --auto-scaling-group-name my-auto-scaling-group --launch-configuration-name my-launch-config --min-size 1 --max-size 3 --vpc-zone-identifier subnet-41767929c

    aws ec2 run-instances --image-id ami-1a2b3c4d --count 1 --instance-type t1.micro --key-name MyKeyPair --security-groups MySecurityGroup

    aws ec2 terminate-instances --instance-ids i-5203422c

    # fault inject (you need to find out the what is the instance-id you have created)

    aws ec2 terminate-instances --instance-ids i-5203422c

    # fault happen 
    
    aws autoscaling attach-instances --instance-ids i-5203422c --auto-scaling-group-name my-auto-scaling-group




fi 