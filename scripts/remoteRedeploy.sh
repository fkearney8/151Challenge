#!/bin/sh

set -e

#Script to be run on the remote host to redeploy the 151 Challenge application
#Kill an existing application
if [ -f ~/151Challenge/151challenge-1.0-SNAPSHOT/RUNNING_PID ]; then
    kill $(cat ~/151Challenge/151challenge-1.0-SNAPSHOT/RUNNING_PID)
    echo "Killed previous application"
fi
#clear out the deployment folder
rm -fr ~/151Challenge/151challenge-1.0-SNAPSHOT
#Unzip the uploaded distribution
unzip ~/151Challenge/151challenge-1.0-SNAPSHOT.zip -d ~/151Challenge

#start 'er up
~/151Challenge/startup.sh

sleep 5s
echo "\n\nHit ctrl-c if everything looks good"
