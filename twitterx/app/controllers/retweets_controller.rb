class RetweetsController < ApplicationController
  before_action :find_tweet
  before_action :find_retweet, only: [:destroy]
  def create
    if already_retweeted?
      flash[:notice] = "You can't retweet more than once"
    else
      @tweet.retweets.create(user_id: current_user.id)
      @tweet = Tweet.new(user_id: current_user.id, content: "Retweet from ↪ : #{@tweet.user.name} --#{@tweet.content}--")
      @tweet.retweets_count += 1 
    end
      @tweet.save
      redirect_to tweets_path(@tweet), notice: 'Retweet it!.'
  end

  def destroy
    if !(already_retweeted?)
      flash[:notice] = "Cannot unretweet"
    else
      @retweet.destroy
      @tweet.retweets_count -= 1 
    end
    @tweet.save
    redirect_to tweets_path(@tweet)
  end

  private
  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
  def already_retweeted?
    Retweet.where(user_id: current_user.id, tweet_id:
    params[:tweet_id]).exists?
  end
  def find_retweet
    @retweet = @tweet.retweets.find(params[:id])
  end
end
