#!/bin/bash
URL="http://127.0.0.1:59510"
REQUESTS=1000
for i in $(seq 1 $REQUESTS)
    do
        curl -s $URL > /dev/null &
    done

wait
echo "Load testing completed"