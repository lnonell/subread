
#################################################################
# Dockerfile
#
# Version:          1
# Software:         subread
# Description:      packe at sourceforge to obtain counts from bam files
# Website:          https://github.com/isglobal-brge/r4bepanel|https://hub.docker.com/r/lnonell/r4BEpanel
# Tags:             1.6.1
# Base Image:       ubuntu
# Mantainer:        lnonell
#################################################################


FROM debian

RUN apt-get update --fix-missing\
    && apt-get install -y \
        build-essential \
        gcc-multilib \
        apt-utils \
        zlib1g-dev \
        libxml2-dev \
        curl \
        libncurses5-dev     
      
# Install subread 
WORKDIR /usr/local/ 
RUN wget "https://sourceforge.net/projects/subread/files/subread-1.6.1/subread-1.6.1-source.tar.gz"
RUN ls | grep subread
RUN tar -xzvf subread-1.6.1-source.tar.gz
WORKDIR /usr/local/subread-1.6.1-source/src 
RUN make -f Makefile.Linux 
RUN ln -s /usr/local/subread-1.6.1-source/bin/* /usr/local/bin
