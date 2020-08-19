FactoryBot.define do
  factory :comment do
    association :tweet, factory: :tweet, strategy: :create
    association :user, factory: :user, strategy: :create

    text { 'test comment' }
  end
end
