#!/bin/bash
DARKGRAY='\033[1;30m';
GREEN='\033[0;32m';
LIGHTPURPLE='\033[1;35m';
CYAN='\033[0;36m';
RED='\033[0;31m';
LIGHTPURPLE='\033[1;35m'
ORANGE='\033[0;33m'
if [ "$1" != "init" ]; then 
	echo -e  "${CYAN}";
	if [ $(( ( RANDOM % 10 )  + 1 )) == 9 ] || [ $(( ( RANDOM % 10 )  + 1 )) == 8 ]; then 
		sed -n 28,34p base;
	elif [ $(( ( RANDOM % 10 )  + 1 )) == 5 ] || [ $(( ( RANDOM % 10 )  + 1 )) == 4 ]; then 
		sed -n 36,43p base;
	elif [ $(( ( RANDOM % 10 )  + 1 )) == 2 ] || [ $(( ( RANDOM % 10 )  + 1 )) == 1 ]; then 
		sed -n 45,52p base;
	elif [ $(( ( RANDOM % 10 )  + 1 )) == 7 ]; then 
		sed -n 54,64p base;
	else 
		sed -n 1,9p base;
	fi
	echo -e  "";
fi 
legend(){
	if [ "$1" == "parameter" ]; then 
		echo -e  " ${LIGHTPURPLE}  ᴘᴀʀᴀᴍᴇᴛʀᴏ ɴᴏɴ ᴠᴀʟɪᴅᴏ ${GREEN} ";
	else
		echo -e  "${ORANGE}";
		sed -n 11,26p base;
		echo -e  "${GREEN}";
	fi
	echo -e  "╔═══Comandi funzionanti═══╗";
	echo -e  "║- build                  ║";
	echo -e  "║                         ║";
	echo -e  "║- ${RED}[-e] [-d]${GREEN} start ${RED}[name] ${GREEN}║";
	echo -e  "║                         ║";
	echo -e  "║- -e stop ${RED}[name]${GREEN}         ║";
	echo -e  "║                         ║";
	echo -e  "║- delete ${RED}[name]${GREEN}          ║";
	echo -e  "║                         ║";
	echo -e  "╠═════════════════════════╣";
	echo -e  "║- ${LIGHTPURPLE}push-delete OK     ${GREEN}    ║";
	echo -e  "╚═════════════════════════╝";
	echo -e  "";
	echo -e  "${RED}[X]${GREEN} = Parametri non obbligatori";
	echo -e  "${LIGHTPURPLE}[X]${GREEN} = Cancella bot e tutti i suoi file";
}
if [ "$1" == "init" ]; then
	legend;
elif [ "$1" == "-e" ] && [ "$2" == "start" ] && [ "$3" == "" ]; then
	echo -e  "Wait....";	
	docker start not-selected;
	echo -e  "Started exist container:${GREEN}OK${GREEN}";
elif [ "$1" == "-e" ] && [ "$2" == "start" ] && [ "$3" != "" ]; then 
	echo -e  "Wait....";
	docker start $3;
	echo -e  "Started exist in background mode container: ${GREEN}OK${GREEN}";
elif [ "$1" == "-e" ] && [ "$2" == "-d" ] && [ "$3" == "start" ] && [ "$4" != "" ]; then 
	echo -e  "Wait....";
	docker start -i $4;
	echo -e  "Started not in background mode exist container: ${GREEN}OK${GREEN}";
elif [ "$1" == "-e" ] && [ "$2" == "stop" ] && [ "$3" == "" ]; then
	echo -e  "Wait....";
	docker stop not-selected;
	echo -e  "Stopped exist container: ${GREEN}OK${GREEN}";
elif [ "$1" == "-e" ] && [ "$2" == "stop" ] && [ "$3" != "" ]; then
	echo -e  "Wait....";
	docker stop $3;
	echo -e  "Stopped exist container: ${GREEN}OK${GREEN}";
elif [ "$1" == "delete" ] && [ "$2" != "" ]; then
	echo -e  "delete $2: ";
    docker container rm $2;
elif [ "$1" == "delete" ]; then
	echo -e  "delete all containers, list: ";
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
	echo -e  "Bye Bye from 42 DockerBot by dlanotte.....";
else 
	legend parameter;
fi
