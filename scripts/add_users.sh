#!/usr/bin/env bash
#a script to add a user
#to a Linux server

function usage {
echo "./add_users.sh <local | remote>"
echo "looks for files servers.conf and users.conf in current directory"
echo "adds users either to list of hosts in servers.conf or in local server"
exit 0
}

function check_existing {
if grep $1 /etc/passwd
then
echo "Sorry, user $1 already exists, skipping!"
fi
}

function add_user {
useradd -c "Home of $1" -m -U $1 && \
echo "${1}:Test123" | chpasswd && \
chage -d 0 $1
echo "Created user $1 with pass Test123, to be changed upon first login."
}

function ssh_add_user {
ssh $1 "useradd -c \"Home of $2\" -m -U $2" && \
ssh $1 "echo \"${2}:Test123\" | chpasswd" && \
ssh $1 "chage -d 0 $2"
echo "Created user $2 with pass Test123 on host $1, to be changed upon first login."
}

function prereq_checks {
if [ $1 -ne 1 ]
then
echo "Incorrect number of arguments supplied!"
usage
fi
if [ ! -f servers.conf ]
then
echo "File servers.conf not found!"
exit 1
fi
if [ ! -f users.conf ]
then
echo "File users.conf not found!"
exit 1
fi
}

#start of main logic
#check if all files are in place
#start adding users

prereq_checks "$#"

if [ "$1" == "local" ]
then
for user in `cat users.conf`
do
check_existing "$user" && add_user "$user"
done
elif [ "$1" == "remote" ]
then
for server in `cat servers.conf`
do
for user in `cat users.conf`
do
ssh_add_user "$server" "$user"
done
done
else
echo "Incorrect value supplied, bailing out"
fi

