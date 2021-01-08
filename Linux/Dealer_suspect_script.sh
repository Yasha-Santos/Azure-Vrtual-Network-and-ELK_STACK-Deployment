#!/bin/bash

echo 'Date -> 0310' > Dealers_working_during_losses.txt
awk '{print $1  $2 "-" $5 "-" $6}' /home/sysadmin/Lucky_Ducky_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/0310_Dealer_schedule | grep -e 05:00:00AM -e 08:00:00AM -e 02:00:00PM -e 08:00:00PM -e 11:00:00PM >> Dealers_working_during_losses.txt
echo 'Date -> 0312' >> Dealers_working_during_losses.txt
awk '{print $1 $2 "-" $5 "-" $6}' /home/sysadmin/Lucky_Ducky_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/0312_Dealer_schedule | grep -e 05:00:00AM -e 08:00:00AM -e 02:00:00PM -e 08:00:00PM -e 11:00:00PM >> Dealers_working_during_losses.txt 
echo 'Date -> 0315' >> Dealers_working_during_losses.txt
awk '{print $1 $2 "-" $5 "-" $6}' /home/sysadmin/Lucky_Ducky_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/0315_Dealer_schedule | grep -e 05:00:00AM -e 08:00:00AM -e 02:00:00PM >> Dealers_working_during_losses.txt
 
