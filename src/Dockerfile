# Base image - Ubuntu 26.04 LTS
FROM ubuntu:26.04

ENV HETRIX_AGENT_PARAMS=''

# About
LABEL version="0.4.0"
LABEL description="Container for Hetrix Linux agent"
LABEL maintainer="github.com/mmohoney"

# Install required packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        wget \
        iproute2 \
        cron \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Create directory for agent installer
RUN mkdir -p /etc/hetrixtools_dl

# Download HetrixTools installer
RUN wget -q \
    https://raw.githubusercontent.com/hetrixtools/agent/master/hetrixtools_install.sh \
    -O /etc/hetrixtools_dl/hetrixtools_install.sh

# Create backup copy of installer
RUN cp -p \
    /etc/hetrixtools_dl/hetrixtools_install.sh \
    /etc/hetrixtools_dl/hetrixtools_install_cp.sh

# Copy startup script
COPY ./src/start.sh /start.sh

# Set execution permissions
RUN chmod +x /start.sh

# Start container
ENTRYPOINT ["/bin/bash", "/start.sh"]
