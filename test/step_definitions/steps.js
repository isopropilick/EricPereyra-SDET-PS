const assert = require('assert');
let request_payload = {};
let response = {};
const I = actor();
// inside step_definitions
Before(() => {
    request_payload = {};
});
Given(/^I have a roomba in the following coordinates: (.*)\$$/, function (coords) {
    request_payload.coords = JSON.parse(coords)
});
Given(/^I have a room that has a dimension of (.*)\$$/, function (rsize) {
    request_payload.roomSize = JSON.parse(rsize)
});
Given(/^There are patches of dirt in the following coordinates: (.*)\$$/, function (patches) {
    request_payload.patches = JSON.parse(patches)

});
Then(/^I send the command to the roomba to perform the following actions: (.*)\$$/, async function (comm) {
    request_payload.instructions = comm
});
Then(/^I got the response from the roomba$/, async function () {
    response = await I.sendPostRequest('v1/cleaning-sessions',request_payload);
});
Then(/^The response code is ([^"]*)\$$/, function (code) {
    I.seeResponseCodeIs(Number(code));
});
Then(/^The position now is ([^"]*)\$$/, function (fpos) {
    I.seeResponseContainsJson(
        {"coords":JSON.parse(fpos)}
    )
});
Then(/^The total cleaned patches of dirt are ([^"]*)\$$/, function (cpatches) {
    I.seeResponseContainsJson(
        {"patches":Number(cpatches)}
    )
});