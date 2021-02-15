# 42Utils 2021 by dlanotte

42Utils files

## Installation

ft_server utils
```bash
git clone https://github.com/zxcvbinz/42-utils.git && cd 42-utils/ft_server_utils/ && mv * ../../ && cd ../../ && chmod 755 ./docker_helper.sh && echo base >> .gitignore && echo docker_helper.sh >> .gitignore && echo 42-utils >> .gitignore &&./docker_helper.sh 
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
