class HomeController < ApplicationController
  def index
    @tweets = Tweet.time_line(current_user)
    @tweet = Tweet.new
    @to_follow = User.to_follow(current_user)
    @value = 'Tweet here ...'
  end
end
