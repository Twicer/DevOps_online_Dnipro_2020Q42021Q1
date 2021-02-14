#!/bin/bash

echo -e "\nSOURCE ==>" "$1" "DESTINATION ===>" "$2" | logger
ONE=$1 TWO=$2
inodeElement=$(stat -c %i $ONE)
input=$(find -inum $inodeElement|cut -b 2-255)
#max length file in linux is 255 english symbols or "127,5" cyrillic symbols

inputBranch=$(pwd $ONE)
outputDestination=$(echo "$TWO""$input")
echo "Input:" "$input"
echo "InputBranch:" "$inputBranch"
echo "Output Result:" "$outputDestination"
input=0
input=$(rsync -apzhtb --info=BACKUP2,COPY1,DEL1,REMOVE2,SKIP2,NAME1 --dry-run $ONE $TWO)
destination=$(rsync -apzhtb --info=BACKUP2,COPY1,DEL1,REMOVE2,SKIP2,NAME1 --dry-run $outputDestination $inputBranch)

echo "in" $input
echo "dest" $destination


if [[ -n "$input" ]];
     then
        echo $input | sed 's/ /\n/g' | sed 's/$/ *NEW/' | logger
        rsync -apzhtb $ONE $TWO
fi

if [[ -n "$destination" ]];
     then
        echo $destination | sed 's/ /\n/g' | sed 's/$/ !DELETE on Destination/' | logger 
fi

input=$(crontab -l -u $USER | grep "./31.sh")
#if [[ $input!=FALSE ]];
if [[ -n input ]];
     then
        sudo echo "5 /1 * * * *   main    ./31.sh" "$ONE" "$TWO" >> /var/spool/cron/crontabs/$USER
        sudo systemctl restart cron.service
fi
#sudo cat /var/log/syslog | grep "*NEW"
