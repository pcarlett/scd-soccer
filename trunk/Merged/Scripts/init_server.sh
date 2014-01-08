POLYORB_DSA_NAME_SERVICE="$(cat ./Scripts/ior.txt)"
export POLYORB_DSA_NAME_SERVICE
./bin/server_partition &
echo "Press Q for Server Termination"
read Q
killall server_partition
echo Server Ended