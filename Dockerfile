FROM python:2-alpine

RUN apk add --no-cache tzdata \
  && ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime

COPY requirements.txt /usr/src/app/requirements.txt
WORKDIR /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt
COPY cloudflare.py /usr/src/app/

CMD ["./cloudflare.py"]
