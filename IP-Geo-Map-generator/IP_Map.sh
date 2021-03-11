#!/bin/bash
#Peter Kalis 


#-------------------------------------------------------------------------------
#Project description 
#For this project the first step I took was to figure out the basic steps that 
#need to happen. Which were to loop through the input file, remove the port 
#number,make the curl commands,and output the json data to a file. After the 
#came part2 which was to graph the ips in gnuplot Which used the json data file 
#that I created. Whenever I encountered a problem I would look the error
#code/description if I got one and if the output wasn'tcorrect or what I 
#was expecting I would search for an answer that  fits theproblem that I
#was faceing.
#-------------------------------------------------------------------------------

#------
#Part 1
#------
ip_noPort=0

#loops through the input file to create the data file need to make the graph
while read ip;
do
   #gets the ip from the line in the input file and excludes the port number
   ip_noPort=$(echo "$ip" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
   #echo "$ip_noPort"

   #makes the json request for the current ip address
   #read -r LON LAT CITY COUNRTY <<<$(curl -s https://json.geoiplookup.io/"$ip_noPort" | jq -r '.longitude, .latitude, .city .country_name')
   read -r LON <<<$(curl -s https://json.geoiplookup.io/"$ip_noPort" | jq -r '.longitude')
   read -r LAT <<<$(curl -s https://json.geoiplookup.io/"$ip_noPort" | jq -r '.latitude')
   read -r CITY <<<$(curl -s https://json.geoiplookup.io/"$ip_noPort" | jq -r '.city')
   read -r COUNTRY <<<$(curl -s https://json.geoiplookup.io/"$ip_noPort" | jq -r '.country_name')
  
   #echo "Longitude: $LON Latitude: $LAT City: $CITY Country: $COUNTRY"

   #outputs the  returned data to the ip.cor/world.cor file
   echo "$LON $LAT $ip_noPort, $CITY, $COUNTRY" >> ip.cor
   #waits half a second between ip requests as too not get 
   #flagged/banned from the website
   sleep 0.15

done <Router_Security_Notifications_Results.txt
#swap out the input files before submitting

#------
#Part 2
#------
    
   #calls the world.gnuplot script
    gnuplot world.gnuplot
