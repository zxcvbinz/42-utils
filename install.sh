RED='\033[0;31m';
WHITE='\033[1;37m'

echo "";
echo "Installer 42-Utils 2021 by dlanotte..."
echo "";

if [ "$1" == "docker-utils" ]; then
	echo "Selected Docker-Utils.....";
	echo "Clone repository.......";
	git clone $2
	echo "${RED}";
	echo "Cloned OK";
	echo "${WHITE}";
	echo "Installing......";
	cd 42-utils/ft_server_utils/ 
	mv * ../../
	cd ../../ 
	chmod 755 ./docker_helper.sh 
	echo base >> .gitignore 
	echo docker_helper.sh >> .gitignore  
	rm -dir -f 42-utils
	./docker_helper.sh init
	rm -f install.sh
fi
