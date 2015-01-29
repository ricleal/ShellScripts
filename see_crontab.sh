#!/bin/bash

#
# Display the crontab for all users
# root needed
#

for user in $(cut -f1 -d: /etc/passwd); do echo $user; crontab -u $user -l; done


