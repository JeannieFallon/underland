#!/bin/bash

PROJ=$1

exec docker build -t $PROJ .
