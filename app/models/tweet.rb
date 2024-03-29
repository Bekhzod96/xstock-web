class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  validates :text, :author_id, presence: true
  validates :text, length: { maximum: 250 }

  scope :time_line, lambda { |current_user|
                      where(author: current_user.followeds)
                        .or(where(author: current_user))
                        .includes(author: %i[photo_attachment cover_image_attachment],
                                  likes: [],
                                  comments: [])
                        .order(updated_at: :desc)
                    }
end
