#!/bin/sh
premake5 gmake
if [ ! -d "Builds" ]; then
    mkdir Builds
fi
cd Generated
sleep 1s
make config=debug
