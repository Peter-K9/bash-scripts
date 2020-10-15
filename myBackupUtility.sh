#!/bin/bash
# Peter Kalis
# CSC-382
# automatically creates and archive of my system

#crontab 37 2 * * * /home/pi/myBackupUtility.sh
now=$(date +"%Y-%m-%d")

#creates a compressed tar file and text file of the home directory
tar -cvzf BACKUP$now.tar.gz /home/pi/ > BACKUP-content.txt

#sends a copy of the copmressed tar file to my sun account
scp BACKUP$now.tar.gz pkalis@sun.cs.lsus.edu:BACKUP

#removes the tar file from RPi
rm BACKUP$now.tar.gz 

#sets file permissions on the tar file
ssh pkalis@sun.cs.lsus.edu chmod 700 /home/pkalis/BACKUP/BACKUP$now.tar.gz

#lists the home directory output of the ls command in the backup text file 
ssh pkalis@sun.cs.lsus.edu ls -l > BACKUP-sun-ls.txt








