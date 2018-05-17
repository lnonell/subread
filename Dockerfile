
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


FROM ubuntu

# Install pre-requistes
#
RUN apt-get update --fix-missing
RUN apt-get install -q -y  wget g++ gcc make zlib1g-dev

RUN \
  wget "https://sourceforge.net/projects/subread/files/subread-1.6.1/subread-1.6.1-source.tar.gz" && \
  mv subread* subread-1.6.1-source.tar.gz && \
  tar -xzvf subread-1.6.1-source.tar.gz && \
  cd subread-1.6.1-source/src && \
  make -f Makefile.Linux && \
  mkdir /opt/subread/ && \
  cp -r ../bin/* /opt/subread && \
  cd ../ && \
  rm -rf subread-1.6.1-source/ subread-1.6.1-source.tar.gz
  
RUN apt-get remove -q -y zlib1g-dev wget g++ gcc make  \
    && apt-get autoremove -y

ENV PATH /bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/opt/subread/
