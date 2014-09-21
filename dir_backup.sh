#!/bin/bash

# Script to make back-up copies of files in current directory

TIME=`date +"%F"`
CURDIR=`pwd`
ORIGFILES=`ls`
UNWANTED="bak"
BACKUPFILE="backup-$TIME.tar.bz2"
DESDIR="/home/victoria/bakk"  # The directory path you enter here should already exist

echo "Getting ready to back up $CURDIR"

for f in $ORIGFILES
do
	case "$f" in
	*.bak ) echo "Already bakked - what now?" ; exit 0 ;;
	* )
		cp $f $f.bak ;;
	esac
done

echo "Zipping up the files"
tar -cpzf $DESDIR/$BACKUPFILE ./*.bak
rm *.bak
echo "done"

exit 0

# The command to decompress the backup file is tar -xf FILENAME.tar.bz2
