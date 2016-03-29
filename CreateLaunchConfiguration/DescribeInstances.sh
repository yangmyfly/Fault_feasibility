#!/bin/bash  


echo -n "Enter the scenarios number you want to test > "
read scenarios


if [ $scenarios = 1 ] ; then
    # pre-condition 

    aws ec2 run-instances --image-id ami-1a2b3c4d --count 1 --instance-type t1.micro --key-name MyKeyPair --security-groups MySecurityGroup


    # fault inject (you need to find out the what is the instance-id you have created)

    aws ec2 describe-instances --instance-ids i-5203422c


fi 