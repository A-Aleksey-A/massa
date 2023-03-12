#!/bin/bash

function restart_massa() {
    echo -e "Restarting Massa ...................................\n"
    systemctl restart massa
}

cd $HOME/massa/massa-client
while true
do
        echo -e "Check bundlr validator logs \n"
        if [ $(journalctl --tail=20 -u massa 2>&1 | grep -c "Send network event failed An error occurred during channel communication: Failed to send event.") -gt 0 ]; then
            restart_massa
        fi

        date=$(date +"%H:%M")
        echo "Last Update: ${date}"
        printf "Sleep 1 hour\n"
        sleep 1h
done
