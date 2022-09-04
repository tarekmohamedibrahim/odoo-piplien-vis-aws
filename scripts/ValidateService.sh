#!/usr/bin/env bash 

#Include in the file upgrade-modules the list of modules you need to be upgraded on the deployment machine

#get database name
dirname=`dirname $0`
read database_name < "$dirname"/database-name
echo "@ `date '+%F %H:%M:%S'` ran $0" >> /tmp/trace.txt
echo "PATH: $PWD" >> /tmp/trace.txt
echo "database name: $database_name" >> /tmp/trace.txt
if [ -n "$database_name" ]; then
    #Install modules
    while read module
    do
        echo "@ `date '+%F %H:%M:%S'` from the while loop ran $0" >> /tmp/trace.txt

        
        sudo python3 /odoo/odoo-server/odoo-bin --db_user=odoo_update --db_password='odoo_update' --log-level=error --addons-path=/odoo/odoo-server/addons,/odoo/custom/addons --xmlrpc-port=7777 --stop-after-init --database=$database_name --update=$module --db_host "127.0.0.1"
    done < "$dirname"/upgrade-modules
fi

#Start Odoo
echo "@ `date '+%F %H:%M:%S'` restarting the service" >> /tmp/trace.txt
sudo systemctl restart odoo-server.service
