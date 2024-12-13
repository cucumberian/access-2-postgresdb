#!/bin/bash

ACCESS_FILE=${1}

# set output format from arg or postgres by default
if [ -z ${2} ]; then
    OUT_DB_TYPE=postgres
else
    OUT_DB_TYPE=${2}
fi

DB_NAME=${DB_NAME}
DB_USER=${DB_USER}
DB_HOST=${DB_HOST}
DB_PORT=${DB_PORT}
DB_PASSWORD=${DB_PASSWORD}

{
    echo "create database ${DB_NAME};"
    echo "\\c  ${DB_NAME};"
    echo "set autocommit=off";
    bash access2sql.sh ${ACCESS_FILE};
    echo "commit;";
} | PGPASSWORD="${DB_PASSWORD}" psql -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -d postgres
