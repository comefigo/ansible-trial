FROM python:3

# update all
RUN apt-get update && apt-get install -y --no-install-recommends

# install libs
RUN apt-get install -y vim

# Copy default endpoint specific user settings overrides into container to specify Python path
COPY .devcontainer/settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# upgrade pip
RUN pip install --upgrade pip

RUN mkdir /workspace
WORKDIR /workspace

COPY .devcontainer/requirements.txt /workspace/
RUN if [ -f "requirements.txt" ]; then pip install -r requirements.txt && rm requirements.txt*; fi

# copy ssh keys
ADD ./ssh/ /root/.ssh/
RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/*

# add ansible config
ADD ./config/ansible.cfg /root/.ansible.cfg

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y