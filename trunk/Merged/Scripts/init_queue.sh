POLYORB_DSA_NAME_SERVICE="$(cat ./Scripts/ior.txt)"
export POLYORB_DSA_NAME_SERVICE
./bin/queue_partition &
echo "Press Q for Queue Termination"
read Q
killall po_cos_naming
killall queue_partition
echo Queue Ended