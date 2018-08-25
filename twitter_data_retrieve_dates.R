## packages for twitter data
## install below packages if not installed. 
if (!requireNamespace("httpuv", quietly = TRUE)) {
  install.packages("httpuv") }
if (!requireNamespace("rtweet", quietly = TRUE)) {
  install.packages("rtweet") }
if (!requireNamespace("twitteR", quietly = TRUE)) {
  install.packages("twitteR") }


##load the above packages
library(httpuv)
library(rtweet)
library(twitteR)

# Enter the name you assigned to your newly created app from https://developer.twitter.com/en/apps

appname <- " "

#Authenticate twitter credentials

# api key
api_key <- " "

# api secret 
api_secret <- " "

twitter_token <- create_token(app = appname,consumer_key = api_key,consumer_secret = api_secret)

access_token <- " "

access_token_secret <- " "

#Direct Authentication will be setup 
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

#Enter the address(name starting with @) of Retailers from their respective twitter pages. 
Retailers <- c("Walmart","BestBuy","Target")

#Data Processing and retriving the dates for multiple Retailers.

for(i in 1:length(Retailers)){
#converting the list of raw data into dataframe 
    twitter_data <- twListToDF(userTimeline(Retailers[i],n=1500,includeRts = FALSE,excludeReplies = TRUE))

#Create a dataframe with unique social dates to be written to CSV file 
    twitter_data_write <- unique(as.Date(twitter_raw_data$created))

#write a csv file for each Retailer. 
    write.csv2(twitter_data_write,paste0(Retailers[i],".csv"),row.names = FALSE)
 }