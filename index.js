const core = require('@actions/core');
const github = require('@actions/github');

try {
    var sourceDirectory = core.getInput('source-directory');
    if (!sourceDirectory || sourceDirectory.length === 0) {
        sourceDirectory = process.env.GITHUB_WORKSPACE
    }
    const language = core.getInput('language');
    console.log(`Using source directory "${sourceDirectory}"`);
    console.log(`Using language "${language}"`);
    if (!language || language.length === 0) {
        // core.setOutput('command', `oryx build ${sourceDirectory}`);
        core.setOutput('command', 'oryx build --help');
    } else {
        // core.setOutput(`command', 'oryx build ${sourceDirectory} --platform ${language}`);
        core.setOutput('command', 'oryx build --help');
    }
    const payload = JSON.stringify(github.context.payload, undefined, 2);
    console.log(`The event payload: ${payload}`);
} catch (error) {
    core.setFailed(error.message);
}