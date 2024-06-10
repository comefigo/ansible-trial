FROM python:3.12.4-slim-bookworm

# update all
RUN apt-get update && apt-get install -y --no-install-recommends vim bash-completion

# upgrade pip
RUN pip install --upgrade pip

RUN mkdir /workspace
WORKDIR /workspace

COPY .devcontainer/requirements.txt /workspace/
RUN if [ -f "requirements.txt" ]; then pip install -r requirements.txt && rm requirements.txt*; fi

COPY .devcontainer/collection.yml /tmp/
RUN ansible-galaxy collection install -r /tmp/collection.yml

# copy ssh keys
ADD ./ssh/ansible-trial.pem /root/.ssh/ansible-trial.pem
RUN chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/*

# add ansible config
ADD ./config/ansible.cfg /root/.ansible.cfg
RUN chmod 700 /root/.ansible.cfg

# config auto completer & alias
ADD .bashrc /tmp/
RUN cat /tmp/.bashrc >> /root/.bashrc

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y
