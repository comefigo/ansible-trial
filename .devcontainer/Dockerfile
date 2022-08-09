FROM python:3

# update all
RUN apt-get update && apt-get install -y --no-install-recommends vim

# upgrade pip
RUN pip install --upgrade pip

RUN mkdir /workspace
WORKDIR /workspace

COPY .devcontainer/requirements.txt /workspace/
RUN if [ -f "requirements.txt" ]; then pip install -r requirements.txt && rm requirements.txt*; fi

# copy ssh keys
ADD ./ssh/ /root/.ssh/
RUN chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/*

# add ansible config
ADD ./config/ansible.cfg /root/.ansible.cfg
RUN chmod 700 /root/.ansible.cfg

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y
