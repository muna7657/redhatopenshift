# start from base
FROM ubuntu:18.04
LABEL maintainer="mithun.mahapatra.com>"
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev
RUN pip install flask 
# We copy just the requirements.txt first to leverage Docker cache
COPY app.py /opt/
#WORKDIR /app
#RUN pip install -r requirements.txt
#COPY . /app
#CMD [ "python", "./app.py" ]
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0
