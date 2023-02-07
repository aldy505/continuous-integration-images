#!/bin/bash

/wait-for-it.sh zookeeper:2181 --timeout=60 --strict -- echo "Zookeeper is up"
