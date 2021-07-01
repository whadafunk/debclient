#!/bin/bash

# Initializing bash



# Initializing the logging file

touch /var/log/init.log

# Starting the ssh agent

eval $(ssh-agent -s)

if [ $? -ne 0 ]; then
	echo $(date)"->the ssh agent could not be started" >> /var/log/init.log
else
	echo $(date)"->the ssh agent has been started successfully" >> /var/log/init.log
fi

# Adding our private keys to the ssh agent

# I am not actually go and do this for right now, as I have to find a secure method to pass the
# private ssh key passwords. As i found out, there is a docker secret feature, that I still have
# to explore, but until then, this will be just a placeholder.
# If you need to load your private keys, you will have to use ssh-add inside the container 

# starting the sshd daemon

/usr/sbin/sshd -E /var/log/sshd.log

if [ $? -ne 0 ]; then
	echo $(date)"->the sshd daemon could not be started" >> /var/log/init.log
else
	echo $(date)"->the sshd daemon has been started successfully" >> /var/log/init.log
fi


# Starting netcat on port 1234 TCP and UDP

/bin/nc -lvk -p 1234 > /var/log/nc_tcp.log &

if [ $? -ne 0 ]; then
	echo $(date)"->the nc process could not be started completely" >> /var/log/init.log
else
	echo $(date)"->the nc processes have been successfully started (both tcp and udp port 1234)" >> /var/log/init.log
fi


exec /bin/bash

if [ $? -ne 0 ]; then
	echo $(date)"->bash could not be started" >> /var/log/init.log
else
	echo $(date)"->bash has been started successfully" >> /var/log/init.log
fi






############            THE END                 ############
