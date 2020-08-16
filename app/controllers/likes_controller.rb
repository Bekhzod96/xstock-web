class LikesController < ApplicationController
  before_action :set_tweet, only: %i[create destroy]

  def create
    @like = Like.new(tweet: @tweet, user: current_user)
    respond_to { |format| format.js } if @tweet && @like.save
  end

  def destroy
    @like = Like.find_by(tweet: @tweet, user: current_user)

    respond_to { |format| format.js } if @tweet && @like.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
