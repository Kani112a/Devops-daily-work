#!/bin/bash

NAME="DevOps Engineer"
DATE=$(date)

echo "Role: $NAME"
echo "Today: $DATE"
DISK=$(df / | tail -1 | awk '{print $5}' | cut -d'%' -f1)

if [ $DISK -gt 80 ]; then
  echo "WARNING: Disk usage is above 80%"
else
  echo "Disk usage is under control"
fi

