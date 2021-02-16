
```
       444444444   222222222222222         888                   888            
      4::::::::4  2:::::::::::::::22       888                   888            
     4:::::::::4  2::::::222222:::::2      888                   888                     
    4::::44::::4  2222222     2:::::2  .d88888  .d88b.   .d8888b 888  888  .d88b.  888d888 
   4::::4 4::::4              2:::::2 d88" 888 d88""88b d88P"    888 .88P d8P  Y8b 888P"   
  4::::4  4::::4              2:::::2 888  888 888  888 888      888888K  88888888 888     
 4::::4   4::::4           2222::::2  Y88b 888 Y88..88P Y88b.    888 "88b Y8b.     888     
4::::444444::::444    22222::::::22   88888888  "Y88P"  8888888P 888  888  "Y8888  888     
4::::::::::::::::4  22::::::::222     
4444444444:::::444 2:::::22222         888               888                     
          4::::4  2:::::2              888               888        
          4::::4  2:::::2              88888b.   .d88b.  888888       
          4::::4  2:::::2       222222 888 "88b d88""88b 888           
        44::::::442::::::2222222:::::2 888  888 888  888 888      
        4::::::::42::::::::::::::::::2 888 d88P Y88..88P Y88b.      
        444444444422222222222222222222 88888P"   "Y88P"   "Y888   
```

# 42Utils 2021 by dlanotte

42Utils files

## Installation

ft_server utils
```bash
git clone https://github.com/zxcvbinz/42-utils.git && cd 42-utils && chmod 755 ./install.sh && ./install.sh docker-utils https://github.com/zxcvbinz/42-utils.git 
```

## Usage
ft_server utils
```bash
# Utils
./docker_helper.sh build             // build the dockerfile
./docker_helper.sh start [name]      // start the image with custom name 
./docker_helper.sh start             // start the image with pre-name 
./docker_helper.sh -e start [name]   // start already exist container 
./docker_helper.sh delete            // delete all docker images
./docker_helper.sh -e stop [name]    // stop already exist container 

# Delete
./docker_helper.sh push-delete OK    //delete all bot files 
```
@[dlanotte](https://profile.intra.42.fr/users/dlanotte)
