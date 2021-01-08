#!/bin/bash

echo "Hello, "$USER".This is to help find the dealer shcedule at a specific time"
awk '{print $1  $2 "-" $5 "-" $6}' $1_Dealer_schedule | grep $2 
