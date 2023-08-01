#docker-sse file

FROM python:latest

SHELL ["/bin/bash", "-c"]

ENV SHELL /bin/bash 

RUN mkdir -p sse
WORKDIR /sse

COPY src src
COPY config config
COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

WORKDIR /sse/src/

CMD ["python", "-m" , "scalp.spot"]

