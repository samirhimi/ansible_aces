#!/bin/bash

echo2(){

abc01=`virsh list --all | awk '{print $2}'` 

abc02=`virsh list --all | awk '{print $3}'` 

if [ $abc02 == running ];then

      	echo -e $abc01  "\e[32;1m[running]\e[0m"
 
else

     	echo -e $abc01 "\033[31m[shutdown]\033[0m"

 fi
}
