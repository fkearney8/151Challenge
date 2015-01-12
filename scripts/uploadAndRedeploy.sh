#!/bin/sh
set -e

#Script to upload the local version of the 151 challenge web app and start it up on the remote host.
# You must have the private key file "OscarPartyPrivateKey.pem" in your 151Challenge/private directory. Ask
# Frank for it if you do not have it.
# You'll have to ctrl-c out of this when it's done, but if the application starts up you can do that safely and it will
# stay active. We can redirect output so that the final command to start up the remote server would allow the ssh
# session to close, but then we couldn't look for startup problems.

cd $(dirname "$0")/..;
pwd;

echo "\n== Create 151 Challenge standalone distribution ==";
./activator dist;

echo "\n== Uploading 151 Challenge standalone distribution ==";
scp -i private/OscarPartyPrivateKey.pem target/universal/151challenge-1.0-SNAPSHOT.zip ubuntu@ec2-54-165-191-142.compute-1.amazonaws.com:/home/ubuntu/151Challenge;

echo "\n== Uploading remote deploy script ==";
scp -i private/OscarPartyPrivateKey.pem scripts/remoteRedeploy.sh ubuntu@ec2-54-165-191-142.compute-1.amazonaws.com:/home/ubuntu/151Challenge;

echo "\n== Redeploying application on remote host =="
ssh -l ubuntu -i private/OscarPartyPrivateKey.pem ec2-54-165-191-142.compute-1.amazonaws.com "chmod a+x ~/151Challenge/remoteRedeploy.sh && ~/151Challenge/remoteRedeploy.sh"

