[![](https://images.microbadger.com/badges/version/neomediatech/exim-honey-alpine.svg)](https://microbadger.com/images/neomediatech/exim-honey-alpine)
[![](https://images.microbadger.com/badges/image/neomediatech/exim-honey-alpine.svg)](https://microbadger.com/images/neomediatech/exim-honey-alpine)
![](https://img.shields.io/github/last-commit/Neomediatech/exim-honey-alpine.svg?style=plastic)
![](https://img.shields.io/github/repo-size/Neomediatech/exim-honey-alpine.svg?style=plastic)

# exim-honey-alpine
Dockerized version of exim as honeypot service, based on Alpine Linux

## Usage
You can run this container with this command:  
`docker run -d --name exim-honey-alpine -p 25:25 -p 465:465 -p 587:587 neomediatech/exim-honey-alpine`  

Logs are written inside the container, in /var/log/exim/, and on stdout. You can see realtime logs running this command:  
`docker logs -f exim-honey-alpine`  
`CTRL c` to stop seeing logs.  

If you want to map logs outside the container you can add:  
`-v /folder/path/on-host/logs/:/var/log/exim/`  
Where "/folder/path/on-host/logs/" is a folder inside your host. You have to create the host folder manually.  

You can run it on a compose file like this:  

```
version: '3'  

services:  
  exim:  
    image: neomediatech/exim-honey-alpine:latest  
    hostname: exim-honey  
    ports:  
      - '25:25'  
      - '465:465'  
      - '587:587'
```
Save on a file and then run:  
`docker stack deploy -c /your-docker-compose-file-just-created.yml exim-honey`

If you want to map logs outside the container you can add:  
```
    volumes:
      - /folder/path/on-host/logs/:/var/log/exim/
```
Where "/folder/path/on-host/logs/" is a folder inside your host. You have to create the host folder manually.

Save on a file and then run:  
`docker stack deploy -c /your-docker-compose-file-just-created.yml exim-honey`  
