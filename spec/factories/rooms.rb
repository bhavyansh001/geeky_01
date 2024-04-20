FactoryBot.define do
  factory :room do
    name { Faker::Lorem.word }
    user_id { create(:user).id }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
