#!/bin/sh

BASEDIR=$(dirname "$0")
clang-format -i $BASEDIR/../Source/MathLibrary/*.cpp $BASEDIR/../Source/MathLibrary/*.hpp $BASEDIR/../Source/MathLibrary/*.inl $BASEDIR/../Tests/*.cpp $BASEDIR/../Tests/*.hpp
