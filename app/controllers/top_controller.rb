class TopController < ApplicationController
  #skip_before_action :authenticate

 def index
   get_tweet
#   binding.pry
=begin
   @favorite_results.sort_by! {|result| result.favorite_count}
   @favorite_results.reverse!

   @retweet_results.sort_by! {|result| result.retweet_count}
   @retweet_results.reverse!
=end
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
   begin_time1 = (Time.now - 60 * 60 * 24).strftime("%-F_00:00:00")
   end_time1   = (Time.now - 60 * 60 * 24).strftime("%-F_23:59:59")
   begin_time2 = Time.now.strftime("%-F_00:00:00")
   end_time2   = Time.now.strftime("%-F_11:59:59")
   begin_time3 = Time.now.strftime("%-F_12:00:00")
   end_time3   = Time.now.strftime("%-F_23:59:59")

#   @favorite_results = @client.search("lang:ja min_faves:1 since:#{begin_time}_JST until:#{end_time}_JST").take(10)
   @content1 = @client.search("lang:ja since:#{begin_time1}_JST until:#{end_time1}_JST", {lang: 'ja', result_type: 'popular'})
   @content2 = @client.search("lang:ja since:#{begin_time2}_JST until:#{end_time2}_JST", {lang: 'ja', result_type: 'popular'})
   @content3 = @client.search("lang:ja since:#{begin_time3}_JST until:#{end_time3}_JST", {lang: 'ja', result_type: 'popular'})
   puts @content1.count
   puts @content2.count
   puts @content3.count
#   binding.pry

 end

end


=begin

=end
