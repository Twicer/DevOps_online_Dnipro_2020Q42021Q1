#!/bin/bash

echo -e "\nSOURCE ==>" "$1" "DESTINATION ===>" "$2" | logger

echo -e "\nSOURCE ==>" "$1" "DESTINATION ===>" "$2"
inodeElement=$(stat -c %i "$1")
echo "InodeEl:" "$inodeElement"
input=$(find . -inum "$inodeElement" | cut -b 2-255)
#max length file in linux is 255 english symbols or "127,5" cyrillic symbols
#3409341
inputBranch=$(pwd $1)
outputDestination=$(echo "$2""$input")
echo "Input:" "$input"
echo "InputBranch:" "$inputBranch"
echo "Output Result:" "$outputDestination"
input=0
input=$(rsync -apzhtb --info=BACKUP2,COPY1,DEL1,REMOVE2,SKIP2,NAME1 --dry-run $1 $2)
destination=$(rsync -apzhtb --info=BACKUP2,COPY1,DEL1,REMOVE2,SKIP2,NAME1 --dry-run $outputDestination $inputBranch)

echo "in" $input
echo "dest" $destination


if [[ -n "$input" ]];
     then
        echo $input | sed 's/ /\n/g' | sed 's/$/ *NEW/' | logger
        rsync -apzhtb $1 $2
fi

if [[ -n "$destination" ]];
     then
        echo $destination | sed 's/ /\n/g' | sed 's/$/ !DELETE on Destination/' | logger 
fi

input=$(crontab -l -u $USER | grep "/tmp/backup_folders.sh")
#if [[ $input!=FALSE ]];
if [[ -n input ]];
     then
        cp ./31.sh  /tmp/backup_folders.sh
        sudo echo "5 /1 * * * *   main    /tmp/backup_folders.sh" "$1" "$2" >> /var/spool/cron/crontabs/$USER
        sudo systemctl restart cron.service
fi
#sudo cat /var/log/syslog | grep "*NEW"
