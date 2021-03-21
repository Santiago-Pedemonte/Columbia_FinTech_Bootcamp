# Unit 12—Tales from the Crypto

## Background

In this assignment, we apply natural language processing to understand the sentiment in the latest news articles featuring Bitcoin and Ethereum. We also apply fundamental NLP techniques to better understand the other factors involved with the coin prices such as common words and phrases and organizations and entities mentioned in the articles.

## Instructions

### 1 - Sentiment Analysis

Use the [newsapi](https://newsapi.org/) to pull the latest news articles for Bitcoin and Ethereum and create a DataFrame of sentiment scores for each coin.

### 2 - Natural Language Processing

In this section, we use NLTK and Python to tokenize text, find n-gram counts, and create word clouds for both coins. 

#### Tokenize

Be sure to:

1. Lowercase each word.
2. Remove punctuation.
3. Remove stop words.

#### N-grams

Next, look at the ngrams and word frequency for each coin.

1. Use NLTK to produce the ngrams for N = 2.
2. List the top 10 words for each coin.

#### Word Clouds

Finally, generate word clouds for each coin to summarize the news for each coin.


### 3 - Named Entity Recognition

In this section, we build a named entity recognition model for both coins and visualize the tags using SpaCy.


## Resources

[Vader Sentiment Analysis](http://www.nltk.org/howto/sentiment.html)


## Hints and Considerations

The free developer version of the News API limits the total daily requests, so be careful not to exceed the free limits.


