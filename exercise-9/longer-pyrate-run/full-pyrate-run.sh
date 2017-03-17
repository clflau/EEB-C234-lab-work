#! /bin/bash

# Script to run full pyrate pipeline on Canidae

# navigate to the working directory
cd ~/Desktop/eeb-177/lab-work/exercise-9

# download the data
wget -O pbdb_fossil_occ.csv $1 # variable for link to download fossil occurrence data

# use the R script we had created to format the data into a pyrate-friendly file
# NOTE!
# if the output files from the R script already exist in the working directory, 
# THIS STEP WILL NOT WORK!
# The existent files are NOT overwritten!
Rscript process_fossil_data.R

# Verify that the data formatting worked, and redirect the output into a file called 
# data_summary.txt so that it may be inspected later.
python ~/PyRate/PyRate.py canid_occ_PyRate.py -data_info > data_summary.txt

# And then, run PyRate!
python ~/PyRate/PyRate.py Canis_raw_PyRate.py -n $2 # variable for PyRate number of generations
