# psychic-garbanzo
This Bash script extends `shadow-utils` functionality, by providing the user with a script
that checks a whole list of users for their expiry date.

The reason I've written this script is to reduce the tedious work of typing out 
the `chage -l` command for a list of users. I'm releasing this to open-source in the 
hopes that it can be useful to another user; I could not find any other script
that accomplished collecting user data in batch.


NAME
       chage - change user password expiry information

SYNOPSIS
       chage [options] LOGIN

DESCRIPTION
       The chage command changes the number of days between password changes and the
       date of the last password change. This information is used by the system to
       determine when a user must change his/her password.

USAGE

1. download the script, `./get_expiration.sh`, and put it on your server that has your 
userdata and is running shadow-utils
2. make the script an executable, by running `chmod u+x get_expiration.sh`
3. make a `.txt` file with a list of the users you need to look at. (One per line, 
lowercase, no comma at end of each line) Name the file `student-workers.txt`
4. run `./get_expiration.sh`, and view the output file: `sw_exp_info.txt`


This script is open-source, and you are welcome to improve it, adapt it, or 
reference it.
