FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    created_at { Time.current }
    updated_at { Time.current }
    user
  end
end
