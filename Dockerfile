# syntax=docker/dockerfile:1

FROM python:3.13.3-alpine
# Install dependencies
RUN set -eux && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache ffmpeg

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir

COPY *.py ./
COPY streamonitor ./streamonitor 
COPY web ./web

EXPOSE 6969
CMD [ "python3", "Downloader.py"]