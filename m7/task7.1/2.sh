#!/bin/bash
function oneB () {
grep -o -E "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" example_log.log | sort -n | uniq -c | sort -n
echo "+++++++++"
awk -F " " '{ print $1}' example_log.log | uniq -c | sort -n
}

function twoB () {
grep -oE 'https*:\/\/[^\"\)]*' example_log.log | uniq -cd | sort -n
}

function threeB () {
awk -F " " '{ print $1}' example_log.log | uniq -c | sort -n
}

function fourB () {
 awk -F " "      '
 { \
         if ($9 == 404) print "404", $7, $11; \
         else false \
      }' example_log.log
}

function fourB () {
echo "FOURb"
}

function sixB () {
read -p "Need Whois program. Do you want install -whois-? y|n (Need Root)" choice
     if [[ "$chice" == "yes" ]] || [[ "$choice" == "Yes" ]];
     then
        echo "YES"
        apt -y install whois
     else
        echo "OK,No"
   fi
parsedIPs=$(awk -F " " '{ print $1, $12, $14 , $16 " " }' example_log.log | grep -i "bot" | awk -F " " '{print $1}'| sort -u)
echo "$parsedIPs"
echo "+++++++++++++++++++++++++++++++"
massIPs=${parsedIPs[@]}
for IP in $massIPs
do
  echo -n "$IP :: "
  whois -a $IP | grep "country"
  sleep 2
done
}
# grep -o -E '^([0-9]{1,3}\.){3}[0-9]{1,3}'