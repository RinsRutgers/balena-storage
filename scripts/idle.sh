#!/bin/bash

# Just an infinite loop to prevent container from exiting
while : ;
do
  if grep -qs '/mnt/storage' /proc/mounts; then
      echo "It's mounted. now I should check for chizzle"
  else
      echo "It's not mounted."
  fi
  echo 'Fully in the loop'
  sleep 5
done
