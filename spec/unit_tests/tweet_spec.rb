require 'rails_helper'

RSpec.describe 'Tweet' do
  let(:tweet) { build(:tweet) }
  it 'should be valid' do
    assert tweet.valid?
  end

  it 'should not be valid if :author is nil' do
    tweet.author = nil
    tweet.save
    expect(tweet).to_not be_valid
  end

  it 'should not be valid if :text is nil' do
    tweet.text = nil
    tweet.save
    expect(tweet).to_not be_valid
  end

  it 'should not be valid if :text is more then 150 characters' do
    tweet.text = 'a' * 251
    tweet.save
    expect(tweet).to_not be_valid
  end
end
