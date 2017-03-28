FROM python:2

MAINTAINER David "admin@dxscx.com"

RUN apt-get update
RUN apt-get install -y build-essential

RUN pip install numpy
RUN pip install scipy
RUN pip install scikit-learn

RUN apt-get install -y openssh-server  
RUN mkdir /var/run/sshd  
RUN echo 'root:rootroot' |chpasswd  
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config  
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config  
EXPOSE 22 CMD ["/usr/sbin/sshd", "-D"]  