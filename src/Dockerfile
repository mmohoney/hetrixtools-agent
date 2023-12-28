# Base image
FROM ubuntu:20.04

ENV HETRIX_AGENT_PARAMS=''

# About
LABEL version="0.3.0"
LABEL description="Container for Hetrix Linux agent"
LABEL maintainer="github.com/mmohoney"

# Update Ubuntu software repository
RUN apt update

# Install packages from ubuntu software repository
# wget - needed for downloading the agent
# cron - needed for scheduling agent cron job
# iproute2 - needed for ip command
RUN apt install -y wget iproute2 cron && \
    rm -rf /var/lib/apt/lisuts/* && \
    apt clean

# Create directory to download agent to
RUN mkdir -p /etc/hetrixtools_dl

# Download agent from hetrixtools repo
RUN wget https://raw.github.com/hetrixtools/agent/master/hetrixtools_install.sh -P /etc/hetrixtools_dl

# Copy file as the install command will delete the original file
RUN cp etc/hetrixtools_dl/hetrixtools_install.sh etc/hetrixtools_dl/hetrixtools_install_cp.sh
RUN chmod --reference=etc/hetrixtools_dl/hetrixtools_install.sh etc/hetrixtools_dl/hetrixtools_install_cp.sh
RUN chown --reference=etc/hetrixtools_dl/hetrixtools_install.sh etc/hetrixtools_dl/hetrixtools_install_cp.sh

# Copy start.sh script and allow execution
COPY ./src/start.sh ./start.sh
RUN chmod +x ./start.sh

ENTRYPOINT  ["/bin/bash", "./start.sh"]
