#!/bin/bash 
search=$1


#---------------checks if ONE argument is supplied
if [ $# != 1 ]
then
	echo supply ONE argument
	exit 1             # Avsluttet scriptet
fi


#---------------checks to see if there are a website with that name
url="http://commons.wikimedia.org/wiki/Category"
wget -q --spider $url:$search


#---------------exits the scripts if it's not
if [ $? != 0 ] 
then
	echo fant ikke kategorien
	exit 1	#avslutter dersom ingen funn.
fi


#---------------grabs the frontpage
wget -q $url:$search


#---------------calculates and presents the number of fotos
hits=`cat Category:$search | grep "div class=.thumb.*src=.http://upload.wikimedia.org" | wc -l`
echo "There are $hits hits for this search."


#---------------asks if the user want to proceed whith downloading the fotos
echo -n "Do you want to continue? (y/n)"
read answer;


#----------------kills script and delets the content downloaded so far of the user dont want to proceed
if [ $answer != "y" ]
then
	echo "Exiting script..."
	rm Category:$search*
	exit 0
fi

#-------------tests if the searchs' folder have already been created
if [ `ls | grep ^$search  ` ] 
then
	echo "The search have already been performed"
	echo "Exiting..."
	rm Category:$search*
	exit 0
fi

#-------------strips the downloaded frontpage for the foto-urls and downloads the fotos to a directory named like the argument.

urls=`cat Category:$search | grep "div 
class=.thumb.*src=.http://upload.wikimedia.org" | sed s/.*src=.http:..upload.wikimedia.org// | sed s/.jpg.*div.$// | sed s/thumb.//`
for line in $urls
	do
	wget -nd -P$search -A.jpg http://upload.wikimedia.org$line.jpg
	done

#--------------removes the temporary frontpage and exits the script
rm Category:$search
echo "The script have downloaded the fotos"
echo "Exiting..."
