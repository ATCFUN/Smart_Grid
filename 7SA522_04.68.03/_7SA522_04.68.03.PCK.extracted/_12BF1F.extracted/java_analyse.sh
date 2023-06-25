#! /usr/bin/bash
if [ -e "outfile.txt" ]
then
    rm outfile.txt
fi
touch outfile.txt

for items in *
do
    echo "$items"
    SUBSTR='class'
    if [[ "$items" =~ .*"$SUBSTR".* ]]
    then
        echo "$items" >> outfile.txt
        javap -verbose $items | grep "major" >> outfile.txt
        javap -verbose $items >> outfile.txt
        #javap -verbose $items >> outfile.txt
    fi
done
