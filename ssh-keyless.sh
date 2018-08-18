#!/bin/bash
set -x
#ssh-keygen -t rsa -b 4096
NODES=$(grep ansible_host inventory |sed 's/ansible_host\=/?/'|cut -f2 -d'?'|cut -f1 -d ' ')
for node in $NODES
do
ssh-keygen -f ~/.ssh/known_hosts -R $node
ssh-copy-id pi@$node
done
