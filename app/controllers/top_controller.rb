class TopController < ApplicationController
  #skip_before_action :authenticate

 def index
   get_tweet
   @favorite_results.sort_by! {|result| result.favorite_count}
   @favorite_results.reverse!

   @retweet_results.sort_by! {|result| result.retweet_count}
   @retweet_results.reverse!
   binding.pry
 end

 def search

   twitter = Twitter::REST::Search.new

   result = twitter.search("lang:ja min_faves:1500 since:2017-8-14_17:00:00_JST").take(10).each do |i|
   end
 end

 def get_tweet
   @client = Twitter::REST::Client.new do |config|
     # applicationの設定
     config.consumer_key         = Rails.application.secrets.consumer_key
     config.consumer_secret      = Rails.application.secrets.consumer_secret
     # ユーザー情報の設定

     config.access_token         = Rails.application.secrets.access_token
     config.access_token_secret  = Rails.application.secrets.access_token_secret
   end
   begin_time = (Time.now - 1.hour).strftime("%F_%k:00:00")
   end_time = (Time.now - 1.hour).strftime("%F_%k:59:59")
   @favorite_results = @client.search("lang:ja min_faves:1500 since:#{begin_time}_JST until:#{end_time}_JST").take(10)
   @retweet_results = @client.search("lang:ja min_retweets:1500 since:#{begin_time}_JST until:#{end_time}_JST").take(10)


 end

end


=begin

=end
