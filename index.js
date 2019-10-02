const core = require('@actions/core');
const github = require('@actions/github');
const exec = require('child_process').exec

try {
    var sourceDirectory = core.getInput('source-directory');
    if (!sourceDirectory || sourceDirectory.length === 0) {
        sourceDirectory = process.env.GITHUB_WORKSPACE
    }
    const language = core.getInput('language');
    console.log(`Using source directory "${sourceDirectory}"`);
    console.log(`Using language "${language}"`);
    var command = `docker pull docker.io/oryxprod/build:latest`;
    if (!language || language.length === 0) {
        command += `&& docker run --volume ${sourceDirectory}:/repo 'docker.io/oryxprod/build:latest' oryx build --help`; // /repo`;
    } else {
        command += `&& docker run --volume ${sourceDirectory}:/repo 'docker.io/oryxprod/build:latest' oryx build --help`; // /repo --platform ${language}`
    }
    console.log(`Running command '${command}'`);
    exec(`${command}`, (error, stdout, stderr) => {
        console.log(stdout);
        if (stderr && stderr.length !== 0) {
            console.log(`stderr: ${stderr}`);
        }
        if (error !== null) {
            console.log(`error: ${error}`);
        }
    });
    const payload = JSON.stringify(github.context.payload, undefined, 2);
    console.log(`The event payload: ${payload}`);
} catch (error) {
    core.setFailed(error.message);
}