var package=require("./package.json");
var brassTacksAI = require("./lib/brasstacksai.js");
console.log("loaded "+package.name + ", version " + package.version);
exports.handler = function(event, context) {
  brassTacksAI.handleRequest(event, context.done);
}
