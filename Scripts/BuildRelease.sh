#!/bin/sh
premake5 gmake
cd Generated
make config=release
