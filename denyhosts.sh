#!/bin/bash
# denyhosts.sh

cat /var/log/secure | awk '/Failed/{print $(NF-3)}' | sort | uniq -c | awk '{print $2"="$1;}' > /tmp/blackip.txt

DEFINE="5"
denyhostsF="/etc/hosts.deny"

for i in `cat /tmp/blackip.txt`
do
    IP=`echo $i |awk -F= '{print $1}'`
    NUM=`echo $i|awk -F= '{print $2}'`

    if [ $NUM -gt $DEFINE ]; then
        grep $IP ${denyhostsF} > /dev/null

        if [ $? -gt 0 ]; then
            echo "# $(date +%Y%m%d_%H%M) add below ip" >> ${denyhostsF}
            #echo "vsftpd:$IP" >> ${denyhostsF}
            echo "sshd:$IP" >> ${denyhostsF}
        fi
    fi
done
