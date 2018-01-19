#!/bin/bash

mysql -u root -pxvyb7g88 oberlin_environmentaldashboard -B -N -s -e "SELECT id FROM users ORDER BY RAND()" | while read -r line; do
	id=`echo "$line" | cut -f1`
	nohup php /var/www/repos/scripts/jobs/month.php --user_id="$id" > /root/buildingos_logs/"$id"/month.log &
done