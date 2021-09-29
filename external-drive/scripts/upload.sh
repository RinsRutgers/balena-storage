#!/bin/bash
echo "Uploading log file: $2 with serial: $1"
HTTP=$(curl -i -s -X POST -o /dev/null -w "%{http_code}" -F sensorID=$1 -F file=@$2 "https://staging.hbj.hu.nl/userUploads/")
echo "Http response: $HTTP"

if [ $HTTP = 201 ];then
    echo "deleting $2"
    rm $2
fi