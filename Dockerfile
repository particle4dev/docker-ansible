FROM williamyeh/ansible:ubuntu14.04

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y python-pip groff tzdata
RUN pip install --upgrade awscli boto troposphere

# TIMEZONE
ENV TZ Asia/Bangkok
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /etc/ansible

ENV TERM=xterm

# ==> Specify requirements filename;  default = "requirements.yml"
#ENV REQUIREMENTS  requirements.yml

# ==> Specify playbook filename;      default = "playbook.yml"
#ENV PLAYBOOK      playbook.yml

# ==> Specify inventory filename;     default = "/etc/ansible/hosts"
#ENV INVENTORY     inventory.ini

# ==> Executing Ansible (with a simple wrapper)...
#RUN ansible-playbook-wrapper