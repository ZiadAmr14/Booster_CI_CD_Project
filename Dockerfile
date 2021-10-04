FROM ubuntu:latest
RUN apt-get update -qq

#install python3.6
RUN apt-get install -y python3.6 
#install pip3
RUN apt-get install -y python3-pip3 -qq
#Copy the source code of this app to the image
COPY . /simpleApp
#Adjust Work Directory
WORKDIR /simpleApp
#Install required packages
RUN pip3 install -r requirements.txt
#Make migration for databaase
RUN python3.6 manage.py makemigrations
#Apply migrations
RUN python3.6 manage.py migrate


EXPOSE 8000

#Start Server
CMD [ "python3","manage.py","runserver","0.0.0.0:8000" ]
