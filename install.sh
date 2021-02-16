#!/bin/bash
programs=("Docker42Helper")
# ("test2" "test1" "test3")
bold=`tput bold`
underline=`tput smul`
black=`tput setaf 0`
red=`tput setaf 1`
yellow=`tput setaf 3`
green=`tput setaf 2`
blue=`tput setaf 4`
magenta=`tput setaf 5`
reset=`tput sgr0`
bell=`tput bel`

WHITE='\033[1;37m'
DARKGRAY='\033[1;30m';
GREEN='\033[0;32m';
LIGHTPURPLE='\033[1;35m';
CYAN='\033[0;36m';
RED='\033[0;31m';
LIGHTPURPLE='\033[1;35m'
ORANGE='\033[0;33m'

function select_option {

    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "   $1 "; }
    print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { read -s -n3 key 2>/dev/null >&2
                         if [[ $key = $ESC[A ]]; then echo up;    fi
                         if [[ $key = $ESC[B ]]; then echo down;  fi
                         if [[ $key = ""     ]]; then echo enter; fi; }

    # initially print empty new lines (scroll down if at bottom of screen)
    for opt; do printf "\n"; done

    # determine current screen position for overwriting the options
    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - $#))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local selected=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ $idx -eq $selected ]; then
                print_selected "$opt"
            else
                print_option "$opt"
            fi
            ((idx++))
        done

        # user key control
        case `key_input` in
            enter) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    return $selected
}

function select_opt {
    select_option "$@" 1>&2
    local result=$?
    echo $result
    return $result
}

function Choose(){
	echo -e "${bell}${underline}${bold}${yellow}Seleziona un programma\n${reset}"
	case `select_opt "${programs[@]}"` in
	*)
	Choose=${programs[$?]}
	;;
	esac
	export Choose;
}

#
#       444444444   222222222222222    
#      4::::::::4  2:::::::::::::::22  
#     4:::::::::4  2::::::222222:::::2 
#    4::::44::::4  2222222     2:::::2 
#   4::::4 4::::4              2:::::2   
#  4::::4  4::::4              2:::::2 
# 4::::4   4::::4           2222::::2  
#4::::444444::::444    22222::::::22   	by dlanotte
#4::::::::::::::::4  22::::::::222       888     888 888    d8b 888   
#4444444444:::::444 2:::::22222          888     888 888    Y8P 888       
#          4::::4  2:::::2               888     888 888        888          
#          4::::4  2:::::2               888     888 888888 888 888 .d8888b  	
#          4::::4  2:::::2       222222  888     888 888    888 888 88K      
#        44::::::442::::::2222222:::::2  888     888 888    888 888 "Y8888b. 
#        4::::::::42::::::::::::::::::2  Y88b. .d88P Y88b.  888 888      X88 
#        444444444422222222222222222222   "Y88888P"   "Y888 888 888  88888P' 

ft_install(){
	if [ "$1" == "docker-utils" ]; then
		echo -e "Selected Docker-Utils.....";
		echo -e "Clone repository.......";
		git clone https://github.com/zxcvbinz/42-utils.git
		echo -e "${RED}Cloned OK${WHITE}\n";
		echo -e "Installing......";
		cd 42-utils/ft_server_utils
		mv * ../../../
		cd ../../../../ 
		chmod 755 ./docker_helper.sh 
		echo base >> .gitignore 
		echo docker_helper.sh >> .gitignore  
		rm -dir -f 42-utils
		./docker_helper.sh init
		rm -f install.sh
fi
}

Choose programs;
clear;
sed -n 99,115p install.sh | cut -c 2-;
echo -e " ";
case $Choose in
	Docker42Helper)
		echo -e "${red}Selected Docker Helper!\n";
		echo -e "${WHITE}Installing Docker42Helper.....";
		sleep 2;
		clear;
		ft_install docker-utils;
		;;
esac
