#!/usr/bin/bash
# ./get_expiration.sh
#
# Date        Developer Description
#
# 03/11/2021  CSMILEY   Initial Program
#
# This script loops through the file 'student-workers.txt' and runs
# the command `chage -l username` for each OPER in the file.
# The command `chage` is a part of a package called shadow-utils, and
# that package does not have a command to list account info in batch.
# In the future we can schedule this to run in cron, and also take
# filenames as parameters.
#
# Sample output:
#    foozo not found
#    barinis expires:  Jan 01, 2018
#


# Define the file that contains a list of the opers
file='student-workers.txt'

# If the output file exists already, delete it
if [ -f "sw_exp_info.txt" ]
        then
                rm -f "sw_exp_info.txt"
fi

# For every oper in the sw list, run the chage command
while read studentworker; do
        # Define the shadow-utils command for listing acct info
        acctInfo=`chage -l "$studentworker"`
        # Scan the output of chage to see if it was successful
        if ! [[ "does not exist" == *"$acctInfo"* ]]
        then
                cleanAcctInfo=`echo "$acctInfo" | awk 'NR==4'`
                expDate=`echo "$cleanAcctInfo" | cut -d ":" -f2`
                echo -e "$studentworker expires: $expDate" >> sw_exp_info.txt
        else
                echo -e "$studentworker not found" >> sw_exp_info.txt
        fi
done < $file
