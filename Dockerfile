FROM centos
MAINTAINER Douglas Russell <douglas_russell@hms.harvard.edu>

# Setup
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install unzip wget bc

# Requirements
RUN yum -y install java-1.8.0-openjdk
RUN yum -y install python-pip python-devel python-virtualenv python-yaml python-jinja2 numpy scipy python-matplotlib python-tables
RUN yum -y install zlib-devel libjpeg-devel gcc
RUN pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# ICE
RUN wget https://zeroc.com/download/rpm/zeroc-ice-el7.repo -P /etc/yum.repos.d/
RUN yum -y update
RUN yum -y install gcc-c++
RUN yum -y install libdb-utils
RUN yum -y install openssl-devel bzip2-devel expat-devel
RUN yum -y install ice-all-runtime ice-all-devel
RUN pip install "zeroc-ice>3.5,<3.7"
