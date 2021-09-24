#!/bin/bash
echo "Uploading log file: $2 with serial: $1" >> /usr/src/mount.log
curl -v -i -X POST -F sensorID=$1 -F file=@$2 "https://staging.hbj.hu.nl/userUploads/" >> /usr/src/mount.log 2>&1
