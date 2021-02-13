# 42Utils 2021 by dlanotte

42Utils files

## Installation

ft_server utils
```bash
git clone https://github.com/zxcvbinz/42-utils.git && cd 42-utils/ft_server_utils/ && mv * ../../ && cd ../../ && chmod 755 ./docker_helper.sh && ./docker_helper.sh
```

## Usage
ft_server utils
```bash
./docker_helper.sh build             //build the dockerfile
./docker_helper.sh start [name]      //start the image with custom name 
./docker_helper.sh start             // start the image with pre-name 
./docker_helper.sh delete            //delete all docker images
```
@[dlanotte](https://profile.intra.42.fr/users/dlanotte)
