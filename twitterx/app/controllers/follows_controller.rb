class FollowsController < ApplicationController
  def create
    @user_tweet = Tweet.find_by(params[:id])
    @user = @user_tweet.user_id
    @follow = Follow.create(follower_id:current_user.id, following_id:@user)
    @follow.save
    flash[:notice] = "You follow this user now!"
  end
  def destroy
    @follow.destroy
    flash[:notice] = "You unfollow this user now!"
  end
end