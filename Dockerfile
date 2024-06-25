# Updates:
#   Nov 2019: Update base Docker image to use a more recent version of Python
#             You can also use python:3.7.5-slim-buster for a Debian image

#here, we want to specify the programming language and OS. Go look at Dockerhubfor most current version
FROM python:3.7.5-alpine

#we need a folder for the app
RUN mkdir /dockerapp1
WORKDIR /dockerapp1

#You need this for instructions
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

#Use your info here
LABEL maintainer="Malgus WAF <malgus.waf@gmail.com>" \
      version="1.0"
      
#default command when executed 
CMD flask run --host=0.0.0.0 --port=5000
