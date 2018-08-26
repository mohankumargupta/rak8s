all: sshclean sshcopy ping docker sleep cluster

docker:
        ansible-playbook -i inventory docker.yml

sleep:
        sleep 100

cluster:
	ansible -i inventory -m ping all && ansible-playbook -i inventory cluster.yml

sshcopy:
        ssh-copy-id pi@192.168.81.16
        ssh-copy-id pi@192.168.81.86

sshclean:
        ssh-keygen -f "/root/.ssh/known_hosts" -R 192.168.81.16
        ssh-keygen -f "/root/.ssh/known_hosts" -R 192.168.81.86

sshkeygen:
	ssh-keygen -t rsa -b 4096

ping:
        ansible -i inventory -m ping all
