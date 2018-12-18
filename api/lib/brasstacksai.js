exports.handleRequest = function(requestData, callback) {
  var responseData = {
    recieved_as_input: requestData
  };
  callback(null, responseData);
}
