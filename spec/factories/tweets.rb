FactoryBot.define do
  factory :tweet do
    association :author, factory: :user, strategy: :create

    text { 'this a test thought' }
  end
end
