class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms

  has_many :messages, dependent: :destroy

  scope :user_rooms, ->(user) { user.rooms.includes(:users).order(last_message: :desc) }

  def self.create_room(first_user, second_user)
    rooms = Room.joins(user_rooms: :user).where(users: { id: first_user.id }) &
            Room.joins(user_rooms: :user).where(users: { id: second_user.id })
    if rooms.empty?
      room = Room.new
      room.save
      UserRoom.create(room: room, user: first_user)
      UserRoom.create(room: room, user: second_user)
      room.id
    else
      0
    end
  end
end
