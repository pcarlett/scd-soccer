POLYORB_DSA_NAME_SERVICE="$(cat ./Scripts/ior.txt)"
export POLYORB_DSA_NAME_SERVICE
./bin/client2_partition &
echo "Press Q for Client Termination"
read Q
killall client_partition
echo Client Ended