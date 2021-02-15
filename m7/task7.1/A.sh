#!/bin/bash

function one () {
     ping -b -c 5 255.255.255.255
	   echo "File HOSTS:"
	   cat /etc/hosts
          read -p "Do you want ADVANCED SEARCH? y|n (Need Root)" choice
      case "$choice" in 
        y|Y ) echo "Yes"
      sudo apt -y install nmap
      net=$(ip addr | grep dynamic | gawk '{print $2}')
      nmap -sn $net;;
        n|N ) echo "No";;
        * ) echo "Invalid";;
      esac
}

function two () {
 echo "ss"
        ss -tln
	    echo "LSOF"
	   lsof -iTCP -P -n
}

function three () {
        echo "The --all key displays the IP addresses and symbolic names of all hosts in the current subnet"
        echo "The --target key displays a list of open system TCP ports."
}
case "$@" in
    --all)
        one
        ;;
    --target)
        two
        ;;
    *)
        three
        ;;
esac

echo "*Debug: Your Key: $@"
