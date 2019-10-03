#!/bin/sh -l

sourceDirectory = $1
language = $2

if [ -n "$sourceDirectory" ]
then
    echo "Source directory provided: '$sourceDirectory'"
else
    echo "No source directory provided."
fi

if [ -n "$language" ]
then
    echo "Language provided: '$language'"
else
    echo "No language provided."
fi

oryx build --help