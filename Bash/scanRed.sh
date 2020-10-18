#!/usr/bin/env bash

firstIp=$1 
lastIp=$2 

function scanRed { 

    posI=$(find $firstIp ".") 
    posF=$(find $lastIp ".") 
    inicio=${firstIp:$(($posI + 1))} 
    final=${lastIp:$(($posF + 1))} 
    ip=${firstIp:0:$posI} 

    for ((i=$inicio; i<=$final; i++)) 
    do 
    IP=$ip.$i 
    ping -c 1 $IP > /dev/null 2>&1 
    if [ $? -eq 0 ]; 
    then 
    echo "Node whit IP: $IP is up" 
    for j in {20..80} 
    do 
    (echo >/dev/tcp/$IP/$j) > /dev/null 2>&1 && echo "Port $j open" 
    done 
    fi 
    done 

} 

  

function find () { 

    num=${#1} 
    i=0 
    mpos=0 

    while [ $i -lt $num ] 
    do 
    carac=${1:$i:1} 
    if [ $carac == $2 ]; 
    then 
    pos=$i 
    if [ $pos -gt $mpos ]; 
    then 
    mpos=$pos 
    fi 
    fi 
    i=$((i+1)) 
    done 
    echo $mpos 
} 

scanRed  