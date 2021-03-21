Conclusions
---

Use the results of the time series analysis and modeling to answer the following questions:

1. Based on your time series analysis, would you buy the yen now?
- Hard to say based on the results from our ARMA and ARIMA models- their p-values tell us that our predictions didn't particularly fit the data. Our analysis will require some other models to have a better prediction.

2. Is the risk of the yen expected to increase or decrease?
- Yes, according to our GARCH model. Our model predicted that the volatility was gonna increase in the following days with a p-value below our threshold of 5%, which means our model fits our data well enough. As such, we can expect the volatility to rise in the following days with enough certainty to plan a strategy with that prediction in mind. 

3. Based on the model evaluation, would you feel confident in using these models for trading?
- The ARMA and ARIMA models require work for this particular example. However, these predictions would be able to provide much more insight to a trader in other, more seasonal, assets and more cyclical markets- particularly through a longer timeframe. As for trading Forex, stocks, options, etc... I would personally not use the models- at least not in their current state and not by themselves. There are many variables that cannot be captured by the parameters of these models that affect the market drastically. The models would be missing too much information to make accurate predictions.

Use the results of the LR model to answer the following question:

1. Does this model perform better or worse on out-of-sample data compared to in-sample data?
- Our model works better with out-of-sample data- our root mean squared error (RMSE) is lower. 
- In-sample RMSE: 0.41545437184712763
- Out-of-sample RMSE: 0.5962037920929946

- - -
Models:
---
_ARMA_- 
Our ARMA model predicted a decrease in the price of the Yen. Our p-values aren't low enough for the model to be a good fit for this asset. It had an *AIC score* of 15798.142, a *BIC score* of 15832.765, and an order = [2, 1] (2 layers for our AR model or Auto Regressive lags and 1 for our MA model or Moving Average lag). 

_ARIMA_- 
Our ARIMA model, contrary to the previous one, predicted an increase in the price of the Yen. Again, the p-values of our model show us it isn't a good fit. It had an *AIC score* of 83905.238, a *BIC score* of 83960.635, and an order = [5, 1, 1] (5 layers for Auto Regression, 1 for Differentiation, and 1 for Moving Average lag).

_GARCH_- 
Our GARCH model predicted an increase in the volatility of the Yen in the following days. This model was a particularly good fit to our data with a p-value < 0.05. Our model had an order = [2,1]. 

_Linear Regression_- 
Our Linear Regression model did a particularly good job of predicting volatility, but the direction of this volatility was mistaken about half the time. This coincides with the RMSEs we got from both out in-sample and out-of-sample data.

---
