cat base
echo "\n"
if [ "$1" == "-e" ] && [ "$2" == "start" ] && [ "$3" == "" ]; then
	echo "Wait....";	
	docker start not-selected;
	echo "Started exist container: OK";
elif [ "$1" == "-e" ] && [ "$2" == "start" ] && [ "$3" != "" ]; then 
	echo "Wait....";
	docker start $3;
	echo "Started exist container: OK";
elif [ "$1" == "-e" ] && [ "$2" == "stop" ] && [ "$3" == "" ]; then
	echo "Wait....";
	docker stop not-selected;
	echo "Stopped exist container: OK";
elif [ "$1" == "-e" ] && [ "$2" == "stop" ] && [ "$3" != "" ]; then
	echo "Wait....";
	docker stop $3;
	echo "Stopped exist container: OK";
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
else 
	echo "   ᴘᴀʀᴀᴍᴇᴛʀᴏ ɴᴏɴ ᴠᴀʟɪᴅᴏ   \n";
	echo "╔═══Comandi funzionanti═══╗";
	echo "║- build                  ║";
	echo "║- [-e] start [name]      ║";
	echo "║- -e stop [name]         ║";
	echo "║- delete                 ║";
	echo "║                         ║";
	echo "║                         ║";
	echo "║- push-delete OK         ║";
	echo "╚═════════════════════════╝";
	echo "[] = parametri non obbligatori";
fi

