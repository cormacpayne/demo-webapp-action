#!/bin/sh -l

sourceDirectory=$1
language=$2

if [ -n "${sourceDirectory}" ]
then
    echo "Source directory provided: '${sourceDirectory}'"
else
    echo "No source directory provided."
    sourceDirectory=$PWD
fi

oryxCommand="oryx build ${sourceDirectory}"

if [ -n "$language" ]
then
    echo "Language provided: '${language}'"
    oryxCommand="${oryxCommand} --platform ${language}"
else
    echo "No language provided."
fi

eval $oryxCommand