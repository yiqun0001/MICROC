#!/usr/bin/env bash

################################################################################
## These are the step to install all the dependencies
## used in the examples of this repo
## on Ubuntu 18.04 with the lates version as of 04/11/2020
################################################################################
apt-get -y update && apt-get -y upgrade

## Install GCC make and python and pip
apt-get install -y build-essential python3 python3-pip

## This will put python3 as the default binairies call by python
update-alternatives --install /usr/bin/python python /usr/bin/python3 1
update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

################################################################################
## Install bedtools
################################################################################
apt-get -y install bedtools

################################################################################
## Install deeptools and pairtools
################################################################################
## these are required for pyBigWig
apt-get install -y zlib1g-dev libcurl4

pip3 install \
    pysam \
    tabulate \
    numpy \
    scipy \
    py2bit \
    matplotlib \
    pyBigWig \
    deeptools \
    pandas
    
   pip3 install pairtools

################################################################################
## Install bwa
################################################################################
git clone https://github.com/lh3/bwa.git
cd bwa; make -j $(nproc)
ls
./bwa
cp bwa qualfa2fq.pl xa2multi.pl /usr/local/bin
cd

################################################################################
## Install SeqTK
################################################################################
git clone https://github.com/lh3/seqtk.git;
cd seqtk; make
cd

################################################################################
## Install samtools
################################################################################
# First install the following dependencies:
apt-get install -y libncurses5-dev libncursesw5-dev libbz2-dev liblzma-dev

## Then download, compile and assemble samtools
wget https://github.com/samtools/samtools/releases/download/1.11/samtools-1.11.tar.bz2
tar xvf samtools-1.11.tar.bz2 

cd samtools-1.11/
./configure 
make -j $(nproc)
make install

## install htslib
cd htslib-1.11
make
make install
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
cd

###############
##install liblz4
##############
apt-get install liblz4-tool

################################################################################
## Install preseq
################################################################################
wget https://github.com/smithlabcode/preseq/releases/download/v3.1.2/preseq-3.1.2.tar.gz
tar xvf preseq-3.1.2.tar.gz
cd preseq-3*/
./configure --enable-hts CPPFLAGS='-I /home/ubuntu/samtools-1.11/htslib-1.11/' LDFLAGS='-L/home/ubuntu/samtools-1.11/htslib-1.11/'
make -j $(nproc)
make install
cd
