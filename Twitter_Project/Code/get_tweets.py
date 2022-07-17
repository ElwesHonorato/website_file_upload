import json
import pandas as pd
import tweepy
from os import access
from tweepy import OAuthHandler, Stream#, StreamListener
from datetime import datetime

# Key to be researched
key_words =     'Dream OR Future OR Prosperity'

# Access Key Input
bearer_token = 'AAAAAAAAAAAAAAAAAAAAABS2ewEAAAAAg7oPE1YJs4Oj9b2nnmw%2BeRCD7XA%3Dlrp2e2gPEa1KjGGVWTRk6giI5YgIjZnA8uGv5H7SVvCvqum3iL'

today_date = datetime.now().strftime('%Y-%m-%d-%H-%M-%S')


if __name__ == '__main__':
    client   = tweepy.Client(bearer_token)
    response = client.search_recent_tweets(key_words, max_results = 10)
    tweets = response.data

    tweets_list = [[tweet.text] for tweet in tweets]
    ids_list    = [[tweet.id]   for tweet in tweets]

    df_response = pd.DataFrame.from_dict({
    'id'   : ids_list,
    'text' : tweets_list
        })
    df_response.to_csv(f'collected_tweets_{today_date}.csv')
    