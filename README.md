# PostgresProDocker

Docker is built from the project https://postgrespro.ru/ 
OS: ubuntu 22.10
Postgresql: version 15

Build installs wget and Midnight Commander

To build docker, run ```docker build -t pgpro:latest .```

To save docker, run ```docker save -o pgro.tar pgpro:latest```
