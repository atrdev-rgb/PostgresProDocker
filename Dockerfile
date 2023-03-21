# Download base image ubuntu 22.10
FROM ubuntu:22.10

# LABEL about the custom image
LABEL maintainer="admin@admin.com"
LABEL version="0.1"
LABEL description="This is a custom Docker Image for shops."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update -y
RUN apt upgrade -y

RUN apt-get install -y wget mc

RUN wget https://repo.postgrespro.ru/std-15/keys/pgpro-repo-add.sh
RUN sh pgpro-repo-add.sh
RUN apt-get install -y postgrespro-std-15 

RUN rm -rf /var/lib/apt/lists/*
RUN apt clean
   

# Expose Port for the Application 
EXPOSE 5432