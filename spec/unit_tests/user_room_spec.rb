require 'rails_helper'

RSpec.describe 'UserRoom' do
  let(:user_room) { build(:user_room) }
  it 'should be valid' do
    assert user_room.valid?
  end

  it 'record not valid if user nil' do
    user_room.user = nil
    user_room.save
    expect(user_room).to_not be_valid
  end

  it 'record not valid if room nil' do
    user_room.room = nil
    user_room.save
    expect(user_room).to_not be_valid
  end

  it 'duplicated record are not allowed' do
    user_room.save
    duplicated = UserRoom.new(user: user_room.user, room: user_room.room)
    expect(duplicated).to_not be_valid
  end
end
