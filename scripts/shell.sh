#!/bin/bash

PROJ=$1

# Run shell into development image with project dir mounted
exec docker run -it --rm \
    --volume `pwd`:`pwd` \
    --workdir `pwd` \
    --name $PROJ \
    --hostname debian \
    $PROJ
