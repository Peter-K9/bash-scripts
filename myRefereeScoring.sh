#!/bin/bash

# Peter Kalis
# CSC-382
# lab 05

#array that holds the arguments that are passed in
scores=("$@")

#min, max and sum variables
min=${scores[0]}
max=${scores[0]}
sum=0

#loops through the array to find the min and max of the array. Sums array excluding the min and max.
for i in "${scores[@]}";
do
	((i > max)) && max=$i
	((i < min)) && min=$i

	((sum+=i))
done

let "sum = $sum - $min"
let "sum = $sum - $max"

echo "Min is $min"
echo "Max is $max"

echo "Sum is $sum"
