#!/bin/sh
echo "test"
cmd.exe /c "wt.exe" --window 1 new-tab --profile "Ubuntu-18.04 /bin/sh" --tabColor "#a64d79" sshpass -p 'billy' ssh billy@192.168.1.111
