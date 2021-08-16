#!/bin/sh
case "$SSH_ORIGINAL_COMMAND" in
  *\&*)
    echo "Connection closed"
    ;;
  *\;*)
    echo "Connection closed"
    ;;
    rsync*)
    echo -n $(date "+%Y.%m.%d") >> /home/rsnapbackup/backuplog
    echo "$SSH_ORIGINAL_COMMAND" >> /home/rsnapbackup/backuplog
    /usr/bin/sudo $SSH_ORIGINAL_COMMAND
    ;;
  *true*)
    echo $SSH_ORIGINAL_COMMAND
    ;;
  *)
    echo "Connection closed."
    ;;
esac
