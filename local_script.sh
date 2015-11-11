#!/bin/bash
sshpass -p "raspberry" ssh -oStrictHostKeyChecking=no 192.168.0.$1 "echo \"Login Success\""
sshpass -p "raspberry" scp remote_script.sh 192.168.0.$1:/home/pi/remote_script.sh
echo "Script Transferred"
sshpass -p "raspberry" ssh 192.168.0.$1 "sudo /home/pi/remote_script.sh $2 && echo \"Running Remote Script\""
sshpass -p "raspberry" ssh -oStrictHostKeyChecking=no 192.168.0.$2 "sudo ip addr del 192.168.0.$1/24 dev eth0; echo \"Secondary IP Deleted\""
