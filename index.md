<h1>Stock Trading AI</h1>

  This website will be the project's page for the stock trading AI, keeping any updates on it! This AI is by no means perfect, as it assumes there is no relation between the input variables, when in actuality that's what economics is all about!!

  This is just a super naive approach where the goal is to get something that trades at a rate better than chance.

<h2>Problems and Things to Improve</h2>

This doesn't take into consideration the impact of each feature on another, and also currently doesn't take into consideration time.  This means that a data point from last week is just as relevant to the estimate as the most recent, which isn't necessarily the case. This may be remedied by adding deltas to previous data points or adding a time feature.

<h2>Findings</h2>

From the typical resulting weights of running the program, we can see that of the 5 features we consider, opening price, closing price, intra high, intra low, and volume, the first two are very important, while the following two are about 100 times less important, and volume being even less than that.

<h3>Update 3</h3>
Estimates the error rate using k-cross validation.  Typically has around 6% error rate with the given information. I'm assuming there may be a bug inflating this rate.

<h3>Update 2</h3>
Has the foundation for testing the data it currently contains to assume some error rate about itself using k-cross validation.

<h3>Update 1</h3>
Now can predict the next 5 minutes of the stock market using 5 features - high, low, opening, close, and volume - using singular value decomposition to construct weights for individual features.
