FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    created_at { Time.current }
    updated_at { Time.current }
    body { Faker::Lorem.sentence }
    user
  end
end
