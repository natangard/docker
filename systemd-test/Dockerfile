#docker-sse file

FROM python:latest

# 0. replace default shell
# https://stackoverflow.com/a/25423366
SHELL ["/bin/bash", "-c"]

ENV SHELL /bin/bash 

RUN apt update && apt -y install cron && apt -y install systemd

RUN mkdir -p sse

COPY spot.service /etc/systemd/sytem/
WORKDIR /sse

# 2. copy sources
COPY src src
COPY config config
COPY requirements.txt .
#COPY restart_spot.sh .



# 3. install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

WORKDIR /sse/src/

RUN systemctl daemon-reload
RUN systemctl enable spot.service
RUN systemctl start spot.service

#RUN crontab -l | { cat; echo "* * * * * /bin/bash /sse/restart_spot.sh"; } | crontab -
#RUN service cron restart


RUN crontab -l | { cat; echo "* * * * * systemctl restart spot.service"; } | crontab -

RUN service cron restart


#CMD ["python", "-m" , "scalp.spot"]

