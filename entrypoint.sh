#!/bin/bash

set -e

if [ -n "$INPUT_SOURCEDIRECTORY" ]
then
    echo "Source directory provided: '$INPUT_SOURCEDIRECTORY'"
else
then
    echo "No source directory provided."
fi

if [ -n "$INPUT_LANGUAGE" ]
then
    echo "Language provided: '$INPUT_LANGUAGE'"
else
then
    echo "No language provided."
fi

echo $PWD