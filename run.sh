#!/bin/bash

if [ ! -f /tmp/foo.txt ]; then
    echo "Generating ssh keys"
    ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa
fi

echo "starting tmate"
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}' 
echo "started, sleeping"

sleep infinity
