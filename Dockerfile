FROM python:3.13

WORKDIR /app

RUN apt update && apt install build-essential git curl bash -y
 
# Add custom bash profile
RUN echo 'alias ll="ls -lasht"' >> ~/.bashrc
RUN echo 'export PS1="\[\e[1;36m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ "' >> ~/.bashrc
RUN echo 'source ~/.bashrc' >> ~/.bash_profile


COPY app.py .

RUN pip install flask

EXPOSE 80

CMD ["python", "app.py"]
FROM python:3.13-alpine

WORKDIR /app

# Install required packages (musl-compatible)
RUN apk add --no-cache \
    build-base \
    git \
    curl \
    bash

# Bash niceties (only matter if you exec into the container)
RUN echo 'alias ll="ls -lasht"' >> /root/.bashrc && \
    echo 'export PS1="\[\e[1;36m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ "' >> /root/.bashrc

COPY app.py .

# Alpine pip is fine; wheels for Flask are pure Python
RUN pip install --no-cache-dir flask

EXPOSE 80

CMD ["python", "app.py"]

