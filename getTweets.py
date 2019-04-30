#Building an ETL pipeline in Python
import os
import re
import nltk
import numpy as np
import pandas as pd
import mysql.connector
from textblob import TextBlob
import matplotlib.pyplot as plt
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from nltk.stem.porter import PorterStemmer
from wordcloud import WordCloud, STOPWORDS

class tweetObject(object):
    def __init__(self,host,database,user):
        self.password = os.environ['PASSWORD']
        self.host = host
        self.database = database
        self.user = user

    def MySQLConnect(self,query):
        #Connects to database and extracts raw tweets and other
        #Columns that are needed
        try:
                con = mysql.connector.connect(host=self.host,database=self.database,
                                              user = self.user,password = self.password,charset='utf8')
                if con.is_connected():
                    print("Successfully connected to database")
                    cursor = con.cursor()
                    query = query
                    cursor.execute(query)

                    data = cursor.fetchall()
                    #Store in database
                    df = pd.DataFrame(data,columns=['date','tweet'])
                    #print(df.head())
        except Error as e:
            print(e)
        cursor.close()
        con.close()

        return ddf
    
