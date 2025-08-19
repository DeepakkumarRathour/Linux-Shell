
$ cat logs.sh
#!/bin/bash
#$Revision:001$

#Declaring Variables
BASE=/var/logs   #provide path for whoch you want to run this script
DAYS=1
DEPTH=1
RUN=0


#Check if the directory is present or not

if [ ! -d $BASE]
then
        echo "directory is not present : $BASE"
        exit 1
fi


#Create 'archive' folder if not present in the given location

if [ ! -d $BASE/archive ]
then
        mkdir $BASE/archive
fi


#Find the list of files larger than 10MB and then using for loop on it.

for i in `find $BASE -maxdepth $DEPTH -TYPE f -size +20M`
do
        if [ $RUN -eq 0 ]
        then
                gzip $i || exit 1
                mv $i.gz $BASE/archive  || exit  1
        fi
done
