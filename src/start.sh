#!/bin/bash 

trap cleanup INT TERM

echo "***Starting"

cleanup() {
    echo "***Stopping"
    exit
}

cp etc/hetrixtools_dl/hetrixtools_install_cp.sh etc/hetrixtools_dl/hetrixtools_install.sh
echo "***Copied hetrixtools_install_cp.sh to hetrixtools_install.sh"

chmod --reference=etc/hetrixtools_dl/hetrixtools_install_cp.sh etc/hetrixtools_dl/hetrixtools_install.sh
echo "***Set file permissions"

chown --reference=etc/hetrixtools_dl/hetrixtools_install_cp.sh etc/hetrixtools_dl/hetrixtools_install.sh
echo "***Set file owners"

chmod u+r+x etc/hetrixtools_dl/hetrixtools_install.sh
echo "***Set as executable"

etc/hetrixtools_dl/hetrixtools_install.sh $HETRIX_AGENT_PARAMS
echo "***Installed agent"

echo "***Starting cron"
cron start

while :; do
    tail -f /dev/null & wait ${!}
done
