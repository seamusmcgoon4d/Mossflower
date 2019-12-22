#!/bin/sh

premake5 gmake
sleep 1s

cd Generated
make config=test
sleep 1s

cd ../Build/Bin/MathTests/Test/
./MathTests
