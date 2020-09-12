class ApiController < ApplicationController
  http_basic_authenticate_with name: "1234", password: "1234", only: [:news, :date]
  skip_before_action :verify_authenticity_token, :only => [:tweet]
  # before_action :tweet_params 
  
  def news
      tweets = []
      @tweets = Tweet.last(50)
        @tweets.each do |tweet|
        tweets <<  { id: tweet.id, content: tweet.content, user_id: tweet.user_id, likes_count: tweet.likes_count, retweets_count: tweet.retweets_count, rewtitted_from: tweet.retweets.ids.last }
        end        

      if tweets
        render json: tweets
      else
        render json: 'error getting tweets', status: 400  
      end
  end
  def date
      @tweets_date = Tweet.where(created_at: [params[:start_date]..params[:end_date]])
      if (params[:start_date] == params[:end_date])
        render json: 'error date, please input different dates', status: 400
      else  
        render json: @tweets_date
      end  
  end

  def tweet
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      render json: @tweet
    else
      render json: 'error posting tweets', status: 400  
    end
  end
  
private  
  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end  
end