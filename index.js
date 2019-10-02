const core = require('@actions/core');
const github = require('@actions/github');

try {
    const sourceDirectory = core.getInput('source-directory');
    if (!sourceDirectory || sourceDirectory.length === 0) {
        sourceDirectory = process.env.GITHUB_WORKSPACE
    }
    const language = core.getInput('language');
    console.log(`Using source directory "${sourceDirectory}"`);
    console.log(`Using language "${language}"`);
    if (!language || language.length === 0) {
        core.setOutput('temp', `Running command "oryx build ${sourceDirectory}"`);
    } else {
        core.setOutput(`temp', 'Running command "oryx build ${sourceDirectory} --platform ${language}"`);
    }
    const payload = JSON.stringify(github.context.payload, undefined, 2);
    console.log(`The event payload: ${payload}`);
} catch (error) {
    core.setFailed(error.message);
}