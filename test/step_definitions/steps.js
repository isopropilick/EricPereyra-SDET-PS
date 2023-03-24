/* eslint-disable */
//const {Given} = require("cucumber");
let request_payload = {};
let response = {};
const I = actor();
// inside step_definitions

Before(() => {
    request_payload = {};
});
Given(/^I have a roomba in the following coordinates: (.*)$/, function (coords) {
    request_payload.coords = JSON.parse(coords)
});
Given(/^I have a room that has a dimension of (.*)$/, function (rsize) {
    request_payload.roomSize = JSON.parse(rsize)
});
Given(/^There are patches of dirt in the following coordinates: (.*)$/, function (patches) {
    request_payload.patches = JSON.parse(patches)

});
Then(/^I send the command to the roomba to perform the following actions: (.*)$/, async function (comm) {
    request_payload.instructions = comm
});
Then(/^I got the response from the roomba$/, async function () {
    response = await I.sendPostRequest('v1/cleaning-sessions',request_payload);
});
Then(/^The response code is ([^"]*)$/, function (code) {
    I.seeResponseCodeIs(Number(code));
});
Then(/^The position now is ([^"]*)$/, function (fpos) {
    I.seeResponseContainsJson(
        {"coords":JSON.parse(fpos)}
    )
});
Then(/^The total cleaned patches of dirt are ([^"]*)$/, function (cpatches) {
    I.seeResponseContainsJson(
        {"patches":Number(cpatches)}
    )
});
Given(/^There are (\d+) patches of dirt in the room, distributed randomly$/, function (n) {
    let maxX = request_payload.roomSize[0], maxY = request_payload.roomSize[1], rpatch = [], i = 0;
    for (; i < n; i++) {
        let xVal = Math.floor(Math.random() * maxX);
        let yVal = Math.floor(Math.random() * maxY);
        rpatch.push([xVal, yVal]);
    }
    request_payload.patches = rpatch;
});
Given(/^There are no patches of dirt in the room$/, function () {
    request_payload.patches = [];
});