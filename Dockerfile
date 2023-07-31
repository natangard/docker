#docker-sse file

# docker build -t poker-auth .
# docker build -t poker-auth --build-arg DSN=postgresql://postgres:12345678@localhost/demo .
# docker run -it --net=host --name=poker-auth-instance poker-auth
# docker exec poker-auth-instance /bin/bash -c 'cat auth/.env'
# docker exec -it poker-auth-instance /bin/bash

FROM python:latest

# 0. replace default shell
# https://stackoverflow.com/a/25423366
SHELL ["/bin/bash", "-c"]

# 1. add a user 'launcher'
ENV USER launcher
RUN useradd -ms /bin/bash $USER
ENV HOME /home/$USER
ENV SHELL /bin/bash
USER $USER
WORKDIR /home/$USER

# 2. copy sources
COPY --chown=$USER auth auth
COPY requirements.txt auth/
#RUN ls -R

# 3. install dependencies
RUN pip install --upgrade pip
ENV PATH="$HOME/.local/bin:${PATH}"
RUN pip install -r auth/requirements.txt


CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0"]



RUN apt-get update && apt-get install python3-pip -y && pip install --upgrade pip && pip install pipenv
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/
COPY . /usr/src/app/
EXPOSE 5000
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "web_interface.py"]

