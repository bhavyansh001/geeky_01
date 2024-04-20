FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    guest { false }
  end
end
