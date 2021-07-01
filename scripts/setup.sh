### Simple script for setting up a debian client container ###

#!/bin/bash

useradd -c "admin" -s /bin/bash -d /home/admin -m admin
mkdir /home/admin/.ssh
chown -R admin.admin /home/admin/

