#!/bin/sh -l

if [ -n "$1" ]
then
    echo "Source directory provided: '$1'"
else
    echo "No source directory provided."
fi

if [ -n "$2" ]
then
    echo "Language provided: '$2'"
else
    echo "No language provided."
fi