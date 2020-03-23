FROM centos:8

RUN yum update -y && \
    yum -y install epel-release;\
    dnf install -y python3

COPY ./requirements.txt /app/requirements.txt

WORKDIR /work

COPY . /work

RUN pip3 install -r requirements.txt

COPY . /app

EXPOSE 80

ENTRYPOINT ["python3"]
CMD ["app.py"]
