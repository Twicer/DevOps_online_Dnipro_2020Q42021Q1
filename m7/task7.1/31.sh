#!/bin/bash

echo -e "\nSOURCE ==>" "$1" "DESTINATION ===>" "$2"
inodeElement=$(stat -c %i $1)
input=$(find -inum $inodeElement|cut -b 2-255)
#max length file in linux is 255 english symbols or "127,5" cyrillic symbols

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

#This element doesn't work properly :((
#inputF=$(crontab -l | grep "cron -e 1**** ./3.1.sh")
#if [[ $input!=FALSE ]];
#     then
#        export DESTF=$2 export SOURCEF=$1 
#        crontab */1 * * * * ./3.1.sh $SOURCEF $DESTF
#fi