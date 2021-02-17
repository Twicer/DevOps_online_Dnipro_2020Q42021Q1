#!/bin/bash

echo -e "\nSOURCE ==>" "$1" "DESTINATION ===>" "$destination\n"
inodeElement=$(stat -c %i $1)
input=$(find -inum $inodeElement|cut -b 2-255)
#max length file in linux is 255 english symbols or 127 cyrillic

inputBranch=$(pwd $1)
outputDestination=$(echo "$2""$input")


echo "Input:" "$input"
echo "InputBranch:" "$inputBranch"
echo "Output Result:" "$outputDestination"

%M%S 

#OTHERS ATTEMPTS
#Saved for the future

#echo `date +%b-%d-%y_%H:%M:%S`

#rsync -apzhtb --info=BACKUP2,COPY1,DEL1,REMOVE2,SKIP2,NAME1 --dry-run $1 $2"
echo -e "\n============"
#rsync -apzhtb --info=BACKUP2,COPY1,DEL1,REMOVE2,SKIP2,NAME1 --dry-run $outputDestination $inputBranch"


#input=$(echo "$1" > grep -E '\/[A-Za-z0-9_!-]+?$')
#inputBranch=$(echo "$1" > grep -E '.*(?=\/)')
#destWithF=$(echo "$2" + inputBranch)
#\/[A-Za-z0-9_!-]+?$
#.*(?=\/)
# отрабатывают не верно \/.*$ и этот \/*{,1}?$


#read -p "Enter Source (Absolute Path)" source
#read -p "Destination (Absolute Path)" destination
#echo "$source", "$destination"
#backuptime=`date +%b-%d-%y`
#DESTINATION=$backuptime-backup.tar.gz 
#tar -cpzf $DESTINATION $source 
#rsync -apvzht --info=BACKUP,COPY,DEL,REMOVE,NAME1 $1 $2  --log-file=mylog.txt && cat mylog.txt
#I had an idea to implement it via sync, but the flags (removed left | right removed) did not work correctly. I gave up the idea, but the draft will leave.
#rsync -avzh --dry-run $1 $2
#rsync -apvzht --dry-run $1 $2 --log-file=mylog.log
#-info=COPY2,DEL2,NAME2,BACKUP2,REMOVE2,SKIP2 -a source/ dest/ > log.txt
#rsync -apvzht --dry-run $1 $2 --info=BACKUP,COPY,RECIEVE,DEL,NAME
#rsync -apvzht --info=BACKUP,COPY,DEL,REMOVE,NAME1 $1 $2  --log-file=mylog.txt && cat mylog.txt
### INFO FLAGS like REMOVE and Delete don't work correctly!
#destLog=$(rsync -apvzht --dry-run $1 $2 --info=BACKUP,COPY,REMOVE,DEL,NAME)
#echo "$1"
#echo "$1" > grep -E '.?\/$'
#sourceLog=$(rsync -apvzht --dry-run $2 $1 --info=BACKUP,COPY,REMOVE,DEL,NAME)