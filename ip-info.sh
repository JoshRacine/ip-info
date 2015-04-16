#!/bin/bash
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

echo ""
ip=$(curl -s checkip.dyndns.org 2>/dev/null| sed -e 's/.*Current IP Address: //' -e 's/<.*$//' 2>/dev/null)
echo "${blue}$ip${reset}"
echo ""
geo=$(curl http://api.hackertarget.com/geoip/\?q\="$ip" 2>/dev/null)
echo "${cyan}$geo${reset}"
echo ""
check=$(curl -s https://check.torproject.org/ 2>/dev/null | grep -oE 'Sorry. You are not using Tor.|Congratulations. This browser is configured to use Tor.' 2>/dev/null)
if [ $(echo $check | wc -m) -eq 30 ]
then
        echo "${red}$check"
else
        echo "${green}$check"
fi
echo ""



