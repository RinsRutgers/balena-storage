#!/bin/bash

# an infinite loop to check if there is any log files containing "log" on atached storage which triggers an upload process
while : ;
do
  if grep -qs '/mnt/storage' /proc/mounts; then
    filelist=$(find /mnt/ -maxdepth 2 -name "*log*" -print)
    for f in $filelist;do
      serial=$(awk -F',' 'NR==2 {print $1}' $f)
      echo "Found a log file: ${f} to upload with serial: $serial"
      /usr/src/scripts/upload.sh $serial ${f};
    done;
  else
      echo "There is no Sensor connected, waiting for 10 seconds to retry."
  fi
  sleep 10
done
