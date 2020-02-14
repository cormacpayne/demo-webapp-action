#!/bin/sh -l

echo -e "GITHUB_REPOSITORY: '${GITHUB_REPOSITORY}'\n"
echo -e "GITHUB_RUN_ID: '${GITHUB_RUN_ID}'\n"

url="https://api.github.com/repos/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}/jobs"
echo -e "URL: '${url}'\n"

curl -X GET "${url}"