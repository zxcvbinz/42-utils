# #TEST on Valgrind STARTED!!!#
```python
       444444444   222222222222222    
      4::::::::4  2:::::::::::::::22  
     4:::::::::4  2::::::222222:::::2 
    4::::44::::4  2222222     2:::::2 
   4::::4 4::::4              2:::::2 
  4::::4  4::::4              2:::::2 
 4::::4   4::::4           2222::::2  
4::::444444::::444    22222::::::22   
4::::::::::::::::4  22::::::::222       888     888 888    d8b 888   
4444444444:::::444 2:::::22222          888     888 888    Y8P 888       
          4::::4  2:::::2               888     888 888        888          
          4::::4  2:::::2               888     888 888888 888 888 .d8888b      
          4::::4  2:::::2       222222  888     888 888    888 888 88K      
        44::::::442::::::2222222:::::2  888     888 888    888 888 "Y8888b. 
        4::::::::42::::::::::::::::::2  Y88b. .d88P Y88b.  888 888      X88 
        444444444422222222222222222222   "Y88888P"   "Y888 888 888  88888P' 
```

# 42Utils 2021 by dlanotte

### Installation
```bash
git clone https://github.com/zxcvbinz/42-utils.git && cd 42-utils && chmod 755 ./install.sh && ./install.sh && cd ..
```
And select the program...


## Usage
### ft_server utils 

Install this program in the [ft_server] / [dockerfile] folder 
```bash
# Utils
./docker_helper.sh build             # build the dockerfile
./docker_helper.sh start [name]      # start the image with custom name 
./docker_helper.sh start             # start the image with pre-name 
./docker_helper.sh -e start [name]   # start already exist container 
./docker_helper.sh delete            # delete all docker images
./docker_helper.sh -e stop [name]    # stop already exist container 

# Delete
./docker_helper.sh push-delete OK    # delete all bot files 
```
### set-workspace-dark
Install on Desktop :)

### 42utils-command
Install on terminal and use new command!
```bash
- 42delete   #example 42delete .DS_Store delete all DS_Store files from the folder
- 42author   #on the next update with the command 42author update, update the program
- 42search   #example 42search .DS_Store search all DS_Store files in the folder
- 42doctor	[brew] #patch brew update error with brew parameter
- 42setbrew [init-cask] #set brew dowload and install brew on computer, with init-cask set cask-application variable on .Applications folder
- 42download ["https://file.it/file.pdf"] #download file with curl -O command 
```
### Valgrind Installer macOS > 10.15.x  [testend on macOS 11.1]
Install Valgrind on macOS terminal! [Cooming Soon]
```bash
Cooming soon....
```

@[dlanotte](https://profile.intra.42.fr/users/dlanotte)
