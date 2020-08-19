class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[edit update destroy]

  def create
    @tweet = Tweet.new(tweet_params)
    @value = ''
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, flash: { success: 'Tweet created successfully' } }
      else
        format.html { redirect_to root_path, flash: { error: @tweet.errors.full_messages.join('. ') } }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to root_path, flash: { success: 'Tweet updated successfully' } }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to root_url, flash: { success: 'Tweet successfully destroyed' } }
      format.js { render :destroy }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:text, :author_id)
  end
end
