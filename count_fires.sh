#!/bin/bash -l

# step to write
# download the CSV file
curl -o calfire.csv https://gis.data.cnra.ca.gov/datasets/CALFIRE-Forestry::recent-large-fire-perimeters-5000-acres.csv

# print out the range of years found -- you may need to go in and edit the file
cut -d, -f2 calfire.csv

#edit file
nano calfire.csv

#print out range of years and sort
cut -d, -f2 calfire.csv > year
sort year 

#year range: 2017~2021

MINYEAR=2017
MAXYEAR=2021
# write code to set these variables with the smallest and largest years
echo "This report has the years: $MINYEAR-$MAXYEAR"
# if you have problems the CSV file already part of this repository so you can use 'calfires_2021.csv'

# print out the total number of fires (remember to remove the header line)
TOTALFILECOUNT=0
# put your code here to update this variable
echo "Total number of files: $TOTALFILECOUNT"

# print out the number of fire in each year
echo "Number of fires in each year follows:"


# print out the name of the largest file use the GIS_ACRES and report the number of acres
echo "Largest fire was $LARGEST and burned $LARGESTACRES"

# print out the years - change the code in $(echo 1990) to print out the years (hint - how did you get MINYEAR and MAXYEAR?
for YEAR in $(echo 1990)
do
#      TOTAL=$(grep ... | awk ...)
      echo "In Year $YEAR, Total was $TOTAL"
done
