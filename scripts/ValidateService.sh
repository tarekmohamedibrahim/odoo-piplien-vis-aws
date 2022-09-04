#!/usr/bin/env bash 

#Include in the file upgrade-modules the list of modules you need to be upgraded on the deployment machine

#get database name
read database_name < scripts/database-name
echo "@ `date '+%F %H:%M:%S'` ran $0"
if [ -n "$database_name" ]; then
    #Install modules
    while read module
    do
        echo "@ `date '+%F %H:%M:%S'` from the while loop ran $0"
        
        sudo python3 /odoo/odoo-server/odoo-bin --db_user=odoo_update --db_password='odoo_update' --log-level=error --addons-path=/odoo/odoo-server/addons,/odoo/custom/addons --xmlrpc-port=7777 --stop-after-init --database=$database_name --update=$module --db_host "127.0.0.1"
    done < /odoo/custom/scripts/upgrade-modules
fi

#Start Odoo
echo "@ `date '+%F %H:%M:%S'` restarting the service"
sudo systemctl restart odoo-server.service
