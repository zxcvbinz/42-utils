#!/bin/zsh

##################################################################################################
#       444444444   222222222222222    
#      4::::::::4  2:::::::::::::::22  
#     4:::::::::4  2::::::222222:::::2 
#    4::::44::::4  2222222     2:::::2 
#   4::::4 4::::4              2:::::2 
#  4::::4  4::::4              2:::::2 
# 4::::4   4::::4           2222::::2  
#4::::444444::::444    22222::::::22     by dlanotte
#4::::::::::::::::4  22::::::::222       888     888 888    d8b 888   
#4444444444:::::444 2:::::22222          888     888 888    Y8P 888       
#          4::::4  2:::::2               888     888 888        888          
#          4::::4  2:::::2               888     888 888888 888 888 .d8888b      
#          4::::4  2:::::2       222222  888     888 888    888 888 88K      
#        44::::::442::::::2222222:::::2  888     888 888    888 888 "Y8888b. 
#        4::::::::42::::::::::::::::::2  Y88b. .d88P Y88b.  888 888      X88 
#        444444444422222222222222222222   "Y88888P"   "Y888 888 888  88888P' 
##################################################################################################  

blue=`tput setaf 4`
green=`tput setaf 2`
WHITE='\033[1;37m'
#------------------------------------#
bar="";
count=1;
#------------------------------------#
Install42_Utils(){
	git clone https://github.com/zxcvbinz/42-utils.git > /dev/null 2>&1
	cd 42-utils/tools
	mv 42utils_command .42utils-commands
	cd .42utils-commands
	chmod 755 *
	#echo "export PATH=\"\$HOME/.42utils-commands:\$PATH\"" >> ~/.zshrc  
	cd ..
	mv -f .42utils-commands ~/Desktop
	cd ../../../
	rm -dir -f 42-utils
	rm -f install.sh
	export PATH="$HOME/.42utils-commands:$PATH";
}

InstallValgrind(){
	42setbrew;
	#brew remove valgrind #remove valgrind if exist
	#brew tap LouisBrunner/valgrind
	#brew install --HEAD LouisBrunner/valgrind/valgrind #NOT WORKING WITHOUT SUDO

	
	###---###---###---###---###---###
	###   MANUAL_INSTALLER_TEST   ###
	###---###---###---###---###---###
	git clone https://github.com/LouisBrunner/valgrind-macos.git
	cd valgrind-macos
	./autogen.sh
	./configure --prefix=$HOME/goinfre/.valgrind --enable-only64bit
	make 
	make install
	####  echo "export=\"\$HOME/Desktop/test/bin:\$PATH\"" >> ~/.zshrc  
	####  export PATH="$HOME/Desktop/test/bin:$PATH";
	###---###---###---###---###


}
#------------------------------------#

echo "COMING SOON....";

#echo -e "Started Valgrind installer.......";
#Install42_Utils & while [ $count -lt 10 ]; do
#	bar=$bar"▇▇▇";
#	echo -ne ${WHITE}$bar"${WHITE}["$count"0%]\r";
#	sleep 0.5;
#	(( count += 1 ))
#done

#42author -v;
#echo -ne ${green}$bar${WHITE}"[42 UTILS INSTALLED "$count"0%]";
#echo "\n\n\nWAIT FEW SECOND.......\n\n";
#sleep 1.5;
#clear;
#bar="";
#count=1;
#42author
#echo "Install Brew on goinfre...."
#InstallValgrind & while [ $count -lt 10 ]; do
#	bar=$bar"▇▇▇";
#	echo -ne ${WHITE}$bar"${WHITE}["$count"0%]\r";
#	sleep 0.5;
#	(( count += 1 ))
#done