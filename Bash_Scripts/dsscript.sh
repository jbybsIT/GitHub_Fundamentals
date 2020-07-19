#!/bin/bash
#/home/sysadmin/Desktop/Homework/Week3/Lucky_Ducky_Investigation/Roulette_loss_Investigation/Dealer_Analysis
# script main directory: /Dealer_Analysis

#additives setup for organization 
touch 0310_ts.txt 0312_ts.txt 0315_ts.txt
touch Blackjack.txt Roulette.txt TexasHoldEm.txt
echo "Blackjack" > Blackjack.txt
echo "Roulette" > Roulette.txt
echo "TexasHoldEm" > TexasHoldEm.txt
echo "03/10" > 0310_ts.txt
echo "03/12" > 0312_ts.txt
echo "03/15" > 0315_ts.txt

#seperation script for Blackjack file
cat 0310_ts.txt >> Blackjack.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM" 0310_Dealer_schedule | awk -F" " '{print $1, $2, $3, $4}' >> Blackjack.txt
cat 0312_ts.txt >> Blackjack.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM" 0312_Dealer_schedule | awk -F" " '{print $1, $2, $3, $4}' >> Blackjack.txt
cat 0315_ts.txt >> Blackjack.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM" 0315_Dealer_schedule | awk -F" " '{print $1, $2, $3, $4}' >> Blackjack.txt
echo " " >> Blackjack.txt

#seperation script for Roulette  file
cat 0310_ts.txt >> Roulette.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM" 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' >> Roulette.txt
cat 0312_ts.txt >> Roulette.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM" 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' >> Roulette.txt
cat 0315_ts.txt >> Roulette.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM" 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' >> Roulette.txt
echo " " >> Roulette.txt

#seperation script for TexasHoldEm file
cat 0310_ts.txt >> TexasHoldEm.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM" 0310_Dealer_schedule | awk -F" " '{print $1, $2, $7, $8}' >> TexasHoldEm.txt
cat 0312_ts.txt >> TexasHoldEm.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM" 0312_Dealer_schedule | awk -F" " '{print $1, $2, $7, $8}' >> TexasHoldEm.txt
cat 0315_ts.txt >> TexasHoldEm.txt
grep -i "05:00:00 AM\|08:00:00 AM\|02:00:00 PM" 0315_Dealer_schedule | awk -F" " '{print $1, $2, $7, $8}' >> TexasHoldEm.txt
echo " " >> TexasHoldEm.txt

#appending into dealers_Working...
cat Blackjack.txt Roulette.txt TexasHoldEm.txt > Dealers_working_during_losses

#file organization
mkdir Misc
mkdir Timestamps
mkdir Raw_data
mkdir Games
mv 0310_ts.txt 0312_ts.txt 0315_ts.txt ./Timestamps
mv ./Timestamps ./Misc
mv 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule ./Raw_data
mv ./Raw_data ./Misc
mv Blackjack.txt Roulette.txt TexasHoldEm.txt ./Games
mv ./Games ./Misc
mv dsscript.sh ./Misc

#script back up...google saved my ass to rewrite this :]
