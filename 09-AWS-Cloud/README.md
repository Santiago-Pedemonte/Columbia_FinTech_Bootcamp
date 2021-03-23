# Unit 13 Homework Assignment - The Power of the Cloud and Unsupervised Learning

## Robo Advisor for Retirement Plans

### Background

Since machine learning and NLP are disrupting finance to improve customer experience, we've decided to create a robo advisor that could be used by customers or potential new customers to get investment portfolio recommendations for retirement.

In this homework assignment, we combine Amazon Web Services with Python, to create a bot that will recommend an investment portfolio for a retirement plan.

Main tasks:

1. **Initial Robo Advisor Configuration:** Define an Amazon Lex bot with a single intent that establishes a conversation about the requirements to suggest an investment portfolio for retirement.

2. **Build and Test the Robo Advisor:** Make sure that your bot is working and responding accurately along with the conversation with the user, by building and testing it.

3. **Enhance the Robo Advisor with an Amazon Lambda Function:** Create an Amazon Lambda function that validates the user's input and returns the investment portfolio recommendation. This task includes testing the Amazon Lambda function and making the integration with the bot.

##### User Input Validation

* The `age` should be greater than zero and less than 65.
* the `investment_amount` should be equal to or greater than 5000.

##### Investment Portfolio Recommendation

Once the intent is fulfilled, the bot should response with an investment recommendation based on the selected risk level as follows:

* **none:** "100% bonds (AGG), 0% equities (SPY)"
* **very low:** "80% bonds (AGG), 20% equities (SPY)"
* **low:** "60% bonds (AGG), 40% equities (SPY)"
* **medium:** "40% bonds (AGG), 60% equities (SPY)"
* **high:** "20% bonds (AGG), 80% equities (SPY)"
* **very high:** "0% bonds (AGG), 100% equities (SPY)"
