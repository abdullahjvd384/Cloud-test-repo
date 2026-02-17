#!/bin/bash
URL="http://localhost:30007"
REQUESTS=1000
for i in $(seq 1 $REQUESTS)
    do
        curl -s $URL > /dev/null &
    done

wait
echo "Load testing completed"