#!/bin/bash 

/etc/hetrixtools_dl/hetrixtools_install.sh $HETRIX_AGENT_PARAMS

cron -f
