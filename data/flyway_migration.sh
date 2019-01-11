#!/bin/bash 

cat <<EOF > conf/flyway.conf
flyway.url=jdbc:postgresql://$DB_HOST:$DB_PORT/$DB_NAME
flyway.schemas=public
flyway.user=$DB_USERNAME
flyway.password=$DB_PASSWORD
flyway.baselineOnMigrate=true
EOF

sleep 30 
flyway migrate 
