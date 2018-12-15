<h1>Stock Trading AI</h1>

  This website will be the project's page for the stock trading AI, keeping any updates on it! This AI is by no means perfect, as it assumes there is no relation between the input variables, when in actuality that's what economics is all about!!

  This is just a super naive approach where the goal is to get something that trades at a rate better than chance.

<h2>Problems and Things to Improve</h2>

This doesn't take into consideration the impact of each feature on another, and also currently doesn't take into consideration time.  This means that a data point from last week is just as relevant to the estimate as the most recent, which isn't necessarily the case. This may be remedied by adding deltas to previous data points or adding a time feature.

<h2>Findings</h2>

From the typical resulting weights of running the program, we can see that of the 5 features we consider, opening price, closing price, intra high, intra low, and volume, the first two are very important, while the following two are about 100 times less important, and volume being even less than that.  

Deltas don't seem to improve accuracy much
Squaring doesn't seem to improve accuracy much either.

<h2>Next</h2>

Build a RESTful api that can act as a wrapper for the important information from the api we are consuming.  The surface of this api will show whether or not we should bet on a certain stock, and what it's correlated strength is, while giving the range in meta data potentially.

<h3>Request</h3>
<tt> GET /predict/MSFT/minutes</tt>
<h3>Response</h3>
<tt>
{
  "data": [{
      "stock": "MSFT"
      "type": "minutes"
      "prediction": "-1"
      "confidence": ".633"
    }]
}
</tt>

Another step is to test the effectiveness of it's confidence.  Making a correct prediction of up and down 94% of the time still leaves the 6% wrong.
This could lead to big falls in the stock market if the confidence was really high for the ones that it was wrong.
More testing will be done determining whether it has an epic fail or misclassifies 'boundary' cases.

<h3>Update 3</h3>
Estimates the error rate using k-cross validation.  Typically has around 6% error rate with the given information. I'm assuming there may be a bug inflating this rate.

<h3>Update 2</h3>
Has the foundation for testing the data it currently contains to assume some error rate about itself using k-cross validation.

<h3>Update 1</h3>
Now can predict the next 5 minutes of the stock market using 5 features - high, low, opening, close, and volume - using singular value decomposition to construct weights for individual features.
