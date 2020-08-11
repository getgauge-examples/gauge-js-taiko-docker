/* globals gauge*/
"use strict";
const { openBrowser,write, closeBrowser, goto, press, screenshot, text, focus, textBox, toRightOf, click, checkBox, toLeftOf } = require('taiko');
const assert = require("assert");
const headless = process.env.headless_chrome.toLowerCase() === 'true';

beforeSuite(async () => {
    await openBrowser({ headless: headless })
});

afterSuite(async () => {
    await closeBrowser();
});

gauge.screenshotFn = async function() {
    return await screenshot({ encoding: 'base64' });
};

step("Goto TodoBackend", async () => {
    await goto('https://www.todobackend.com/client/index.html?https://todobackend.apphb.com/todo-backend');
});

step("Create a task <task>", async (task) => {
    await write(task);
    await press('Enter');
});

step("Mark <task> as done", async (task) => {
    await click(checkBox(toLeftOf(task)));
});

step("Ensure at least one task is done", async () => {
    assert.ok((await checkBox().elements()).some(x => x.isChecked()));
});