#!/bin/sh -l

sourceDirectory=$1
language=$2
oryxCommand="'docker.io/oryxprod/build:slim' oryx build /repo"

if [ -n "${sourceDirectory}" ]
then
    echo "Source directory provided: '${sourceDirectory}'"
else
    echo "No source directory provided."
    sourceDirectory=$PWD
fi

oryxCommand="docker run --volume ${sourceDirectory}:/repo ${oryxCommand}"

if [ -n "$language" ]
then
    echo "Language provided: '${language}'"
    oryxCommand="${oryxCommand} --platform ${language}"
else
    echo "No language provided."
fi

eval $oryxCommand