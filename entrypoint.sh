#!/bin/sh

echo "entrypoint!"

[ "$SSH_TRUSTED_HOSTS" ] && ssh-keyscan $SSH_TRUSTED_HOSTS >> .ssh/known_hosts
echo "$SSH_KNOWN_HOSTS" >> .ssh/known_hosts
chmod 0600 .ssh/known_hosts

[ "$SSH_PRIVATE_KEY" ] && echo "$SSH_PRIVATE_KEY" > .ssh/id_rsa && chmod 0600 .ssh/id_rsa

input="${@#sh -c}"

if [ "$SSH_CONNECTION_STRING" ]; then
    exec ssh -t $SSH_CONNECTION_STRING "$input"
else 
    exec sh -c "$input"
fi
