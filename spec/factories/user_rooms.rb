FactoryBot.define do
  factory :user_room do
    association :room, strategy: :create
    association :user, strategy: :create
  end
end
