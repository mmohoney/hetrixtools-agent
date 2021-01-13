# HetrixTools Linux Server Monitoring Agent Container

HetrixTools agent located here: https://github.com/hetrixtools/agent

# How to use this image
1. Create or update an uptime monitoring agent to obtain the install commands. 
   1. ex: `wget https://raw.github.com/hetrixtools/agent/master/hetrixtools_install.sh && bash hetrixtools_install.sh 123abc 0 0 0 0 0 0`
2. Use the unique id and permission flags in the below `docker run` command.
   1. ex: `docker run -d -e HETRIX_AGENT_PARAMS="123abc 0 0 0 0 0" mmohoney/hetrixtools-agent:latest `

-= ChangeLog =-

Version 0.1:
- Initial release
