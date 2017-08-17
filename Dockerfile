FROM python:3.6

# ------------------------
# SSH Server support
# ------------------------
ENV DEBIAN_FRONTEND noninteractive

COPY init_container.sh /bin/
RUN apt-get update \ 
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "root:Docker!" | chpasswd \
  && chmod 755 /bin/init_container.sh

RUN apt-get upgrade -y

COPY sshd_config /etc/ssh/

RUN mkdir /code
WORKDIR /code
COPY manage.py /code/
COPY requirements.txt /code/
COPY flaskr /code/flaskr
RUN pip install -r requirements.txt

EXPOSE 2222 5000

CMD ["/bin/init_container.sh"]
