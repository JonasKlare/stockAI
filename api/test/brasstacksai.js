var assert = require("chai").assert;
var brassTacksAI = require("../lib/brasstacksai.js");
describe("brasTacksAI", function() {
  it("exports handleRequest", function() {
    assert.typeOf(brassTacksAI.handleRequest, "function");
  });
});
