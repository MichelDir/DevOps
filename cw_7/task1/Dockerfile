FROM ubuntu:14.04
RUN apt update
RUN apt install python-all python-pip -y
ADD ./app ./tmp/app
#RUN pip install --index-url https://pypi.python.org/simple/ --trusted-host --upgrade pip
#RUN pip install -qr /tmp/app/requirements.txt
CMD ["/bin/bash"]

