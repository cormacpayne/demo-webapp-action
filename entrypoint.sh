#!/bin/sh -l

sourceDirectory=$1
platform=$2
platformVersion=$3

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

if [ -n "$platform" ]
then
    echo "Platform provided: '${platform}'"
    oryxCommand="${oryxCommand} --platform ${platform}"
else
    echo "No platform provided -- Oryx will enumerate the repository to determine the platform."
fi

if [ -n "$platformVersion" ]
then
    echo "Platform version provided: ${platformVersion}''"
    oryxCommand="${oryxCommand} --platform-version ${platformVersion}"
else
    echo "No platform version provided -- Oryx will determine the version."
fi

echo "Running command '${oryxCommand}'"
eval $oryxCommand