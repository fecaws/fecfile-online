#!/bin/bash 

flyway -url=jdbc:postgresql://$DB_HOST:$DB_PORT/$DB_NAME -user=$DB_NAME -password=$DB_PASSWORD -schemas=public migrate
