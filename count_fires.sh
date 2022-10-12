#!/bin/bash -l

# step to write
# download the CSV file
curl -o calfire.csv https://gis.data.cnra.ca.gov/datasets/CALFIRE-Forestry::recent-large-fire-perimeters-5000-acres.csv

# print out the range of years found -- you may need to go in and edit the file
cut -d, -f2 calfire.csv

#edit file
nano calfire.csv

#print out range of years and sort
sort -t, -k2,2n calfire.csv | cut -d, -f2


MINYEAR=2017
MAXYEAR=2021
# write code to set these variables with the smallest and largest years
echo "This report has the years: $MINYEAR-$MAXYEAR"

# if you have problems the CSV file already part of this repository so you can use 'calfires_2021.csv'

# print out the total number of fires (remember to remove the header line)
TOTALFILECOUNT=0


# put your code here to update this variable
sed '1d' calfire.csv  > no_header.csv


TOTALFILECOUNT=$(cat no_header.csv | wc -l)
 

echo "Total number of files: $TOTALFILECOUNT"

# print out the number of fire in each year

echo "Number of fires in each year follows:"
sort -t, -k2,2n no_header.csv| cut -d, -f2 |uniq -c

# print out the name of the largest file use the GIS_ACRES and report the number of acres

sort -t, -k13,13nr no_header.csv| cut -d, -f6,13 | awk -F, 'NR == 1 {print}' > largest.csv
LARGEST=$(awk -F, '{print $1}' largest.csv)
LARGESTACRES=$(awk -F, '{print $2}' largest.csv)
echo "Largest fire was $LARGEST and burned $LARGESTACRES"

# print out the years - change the code in $(echo 1990) to print out the years (hint - how did you get MINYEAR and MAXYEAR?
sort -t, -k2,2nr no_header.csv| cut -d, -f2,13 > year.csv
for YEAR in $(awk -F, '{print $1}' year.csv);
do
    TOTAL=$(grep $YEAR year.csv| awk -F, '{sum+=$2;} END{print sum;}')
    echo "In Year $YEAR, Total was $TOTAL"
done
