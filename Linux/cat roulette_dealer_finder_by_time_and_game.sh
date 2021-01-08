#!/bin/bash

echo "Hello"$USER". This is to help you find the dealer shcedule by specific game and time"
awk '{print $1 $2 $5 $6}' $1_Dealer_schedule | grep $2 | grep -i game
