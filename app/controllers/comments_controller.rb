class CommentsController < ApplicationController
  before_action :set_tweet, only: [:show]

  def show
    @comment = Comment.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @tweet = @comment.tweet
    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, flash: { success: 'comment was successfully created' } }
        format.js
      else
        format.html { redirect_to root_path, flash: { error: @comment.errors.full_messages.join('. ') } }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @tweet = @comment.tweet

    respond_to { |format| format.js } if @comment.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :tweet_id)
  end
end
