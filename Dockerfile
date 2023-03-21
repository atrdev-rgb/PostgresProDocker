# Download base image ubuntu 22.10
FROM ubuntu:22.10

# LABEL about the custom image
LABEL maintainer="admin@admin.com"
LABEL version="0.1"
LABEL description="This is a custom Docker Image for shops."

# Disable Prompt During Packages Installation
ENV TZ=Europe/London
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository and install tzdata, wget and mc
RUN apt-get update && apt upgrade -y \
	&& apt-get install  tzdata wget mc -y \
	&& wget https://repo.postgrespro.ru/std-15/keys/pgpro-repo-add.sh \
	&& sh pgpro-repo-add.sh \
	&& apt update -y && apt upgrade -y \
	&& apt autoremove -y && apt autoclean -y \
	&& apt-get install postgrespro-std-15 -y \
	&& ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
	&& echo ${TZ} > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
	&& apt clean
   
# Expose Port for the Application 
EXPOSE 5432
