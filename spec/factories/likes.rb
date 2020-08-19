FactoryBot.define do
  factory :like do
    association :tweet, strategy: :create
    association :user, strategy: :create
  end
end
