class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :text, :tweet_id, presence: true
  validates :text, length: { maximum: 250 }
end
