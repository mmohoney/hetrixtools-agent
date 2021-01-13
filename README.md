# HetrixTools Linux Server Monitoring Agent Container

HetrixTools agent located here: https://github.com/hetrixtools/agent

# How to use this image
1. Create or update an uptime monitoring agent to obtain the install commands. 
   1. ex: `wget https://raw.github.com/hetrixtools/agent/master/hetrixtools_install.sh && bash hetrixtools_install.sh 123abc 0 0 0 0 0 0`
2. Use the unique id and permission flags in the below `docker run` command.
   1. ex: `docker run -d -e HETRIX_AGENT_PARAMS="123abc 0 0 0 0 0" mmohoney/hetrixtools-agent:latest`
   2. `docker-compose.yml` Update environment variable `HETRIX_AGENT_PARAMS=REPLACE_ME`

-= ChangeLog =-

Version 0.2.0:
- Create a copy of `hetrixtools_install.sh` during download as the install script self removes. 
  - This allows the container to be stopped and started without issues.
- Graceful `exit(0)` on `docker stop` command.
- Included an example `docker-compose.yml`.

Version 0.1:
- Initial release.
