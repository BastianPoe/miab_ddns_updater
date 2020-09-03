#!/bin/bash -e

email=${EMAIL}
password=${PASSWORD}
server=${SERVER}
hostname=${HOSTNAME}
interval=${INTERVAL}

if [ "${email}" == "" ]; then
	echo Please provide an EMAIL via env variable. Aborting.
	exit 1
fi

if [ "${password}" == "" ]; then
	echo Please provide a PASSWORD via env variable. Aborting.
	exit 1
fi

if [ "${server}" == "" ]; then
	echo Please provide a SERVER via env veriable. Aborting.
	exit 1
fi

if [ "${hostname}" == "" ]; then
	echo Please provide a DNS hostname via env variable. Aborting.
	exit 1
fi

if [ "${interval}" == "" ]; then
	interval = 600
fi

echo Config
echo Server:   ${server}
echo Email:    ${server}
echo Password: ******
echo Hostname: ${hostname}
echo Interval: ${interval} s
echo

while [ 1 ]; do
	echo `date`: Starting DDNS update

	# Update IPv4
	curl -4 --user "${email}:${password}" -X "PUT" https://${server}/admin/dns/custom/${hostname}/A

	# Update IPv6
	curl -6 --user "${email}:${password}" -X "PUT" https://${server}/admin/dns/custom/${hostname}/AAAA

	echo

	sleep ${interval}	
done
