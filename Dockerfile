FROM python:3.6

# ------------------------
# SSH Server support
# ------------------------
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /code
WORKDIR /code

EXPOSE 2222 5000

