#!/bin/bash

LOGFILE="/home/hp/day19/maintenance.log"

echo "===== Started at $(date) =====" >> "$LOGFILE"

/bin/bash /home/hp/day19/log_rotation.sh /home/hp/day19/app.log >> "$LOGFILE" 2>&1

/bin/bash /home/hp/day19/backup.sh /home/hp/day19/demo /home/hp/day19/backups >> "$LOGFILE" 2>&1

echo "===== Finished at $(date) =====" >> "$LOGFILE"
echo "" >> "$LOGFILE"

