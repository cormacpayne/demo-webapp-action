#!/bin/sh -l

sourceDirectory=$1
language=$2

if [ -n "${sourceDirectory}" ]
then
    echo "Source directory provided -- appending this directory to the current working directory."
    sourceDirectory="$PWD/${sourceDirectory}"
else
    echo "No source directory provided -- using the current working directory."
    sourceDirectory=$PWD
fi

echo "Source directory: ${sourceDirectory}"
oryxCommand="oryx build ${sourceDirectory}"

if [ -n "$language" ]
then
    echo "Language provided: '${language}'"
    oryxCommand="${oryxCommand} --platform ${language}"
else
    echo "No language provided -- Oryx will enumerate the repository to determine the platform."
fi

echo "Running command '${oryxCommand}'"
eval $oryxCommand