#!/bin/sh -l

echo "Source directory: $1"
echo "Language: $2"

if [ -n "$1" ]
then
    echo "Source directory provided: '$1'"
else
then
    echo "No source directory provided."
fi

if [ -n "$2" ]
then
    echo "Language provided: '$2'"
else
then
    echo "No language provided."
fi

echo $PWD