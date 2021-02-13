cat base
echo "\n"
if [ "$1" == "" ]; then
	echo "Parametro non valido \n\ninserici uno dei seguenti comandi: \n - start [name] \n - delete \n - build";
elif [ "$1" == "delete" ]; then
	echo "delete all containers, list: ";
    docker container rm $(docker container ls -aq);
elif [ "$1" == "build" ]; then
	docker build -t dlanotte_42_helper .
elif [ "$1" == "start" ] && [ "$2" != "" ]; then
	docker run --name $2 -it -p 80:80 -p 443:443 dlanotte_42_helper;
elif [ "$1" == "start" ]; then
	docker run --name not-selected -it -p 80:80 -p 443:443 dlanotte_42_helper;
elif [ "$1" == "push-delete" ] && [ "$2" == "OK" ]; then
	rm base;
	rm -dir -f 42-utils;
	rm docker_helper.sh;
fi


