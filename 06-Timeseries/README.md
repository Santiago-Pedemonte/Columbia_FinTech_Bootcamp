# Unit 10—A Yen for the Future
---
## Time-Series Forecasting

In this notebook, we load historical Dollar-Yen exchange rate futures data and apply time series analysis and modeling to determine whether there is any predictable behavior:

  1. Decomposition using a Hodrick-Prescott Filter (Decompose the Settle price into trend and noise).
  2. Forecasting Returns using an ARMA Model.
  3. Forecasting the Settle Price using an ARIMA Model.
  4. Forecasting Volatility with GARCH.

## Linear Regression Forecasting

In this notebook, we build a Scikit-Learn linear regression model to predict Yen futures ("settle") returns with *lagged* Yen futures returns and categorical calendar seasonal effects (e.g., day-of-week or week-of-year seasonal effects):

  1. Data Preparation (Creating Returns and Lagged Returns and splitting the data into training and testing data)
  2. Fitting a Linear Regression Model.
  3. Making predictions using the testing data.
  4. Out-of-sample performance.
  5. In-sample performance.
