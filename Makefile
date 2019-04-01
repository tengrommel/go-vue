# Assuming some form of ubuntu/debian...
install_docker:
	sudo apt update
	sudo apt install apt-transpor-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
	sudo apt update -y
	sudo apt install docker-ce docker-compose -y
	sudo addgroup --system docker
	sudo adduser $$USER docker
	newgrp docker
	sudo chown $$USER::$$USER /etc/apt/docker.sock
	sudo chown $$USER::$$USER /var/run/docker.sock