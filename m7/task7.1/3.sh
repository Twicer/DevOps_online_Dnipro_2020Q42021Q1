#!/bin/bash
read -p "Enter Source (Absolute Path)" source
read -p "Destination (Absolute Path)" destination

echo "$source", "$destination"
#rsync -avzhe --dry-run 

