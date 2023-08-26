# Peter Kalis
# CSC-382
# Exam 2

#library that is used for regex
import re

#output file for the IP's and ports
results = open("Router_Security_Notifications_Results.txt", "w")

#regex that will find the guest IP and port
pattern = re.compile("(\d{2,3}\.\d{2,3}\.\d{2,3}\.\d{2,3}):(\d*)(\s->\s)98\.234\.56\.78:(\d*)")

#loops through the data file to find the IP's and ports
for line in open("Router_Security_Notifications.txt"):
    #searchs the text for any matches to the regex
    for match in re.finditer(pattern, line):
        #If a match is found, it is written to the results file
        results.write(match.group(1) + "," + match.group(4)+"\n")
        

results.close()

