#!/bin/sh -eux

set +x  # temporarily turn command display OFF.

cd load-generation
./stop.sh

cd ..
cd java-webapps
./stop.sh

cd ..
cd java-monolithic-services
./stop.sh

cd ..
