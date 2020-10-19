#!/bin/bash

# Peter Kalis
# CSC-382 
#Lab05

#array that holds the arguments that are passed in
scores=("$@")

#min, max and sum variables
min=${scores[0]}
max=${scores[0]}
sum=0

#loops throuhg array to find the min and max of the array
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

function lowestValue {
nums=("${scores[@]}")
lowest=${scores[0]}

	for i in "${nums[@]}";
	do
	   ((i < lowest)) && lowest=$i
	done
echo "lowest value is $lowest"
}

function largestValue {
nums=("${scores[@]}")
largest=${scores[0]}
	for i in "${nums[@]}";
	do 
	   ((i > largest)) && largest=$i
	done
echo "The Largest value is $largest"
}

function sum {
nums=("${scores[@]}")
small=${scores[0]}
big=${scores[0]}
total=0
	for i in "${nums[@]}";
	do
	   (( i < small)) && small=$i
	   (( i > big)) && big=$i

	   ((total+=i))
	done
((total = total - big))
((total = total - small))
echo "The sum of all the scores is $total"
}

lowestValue "${scores[@]}" 
largestValue "${scores[@]}"
sum "${scores[@]}"
