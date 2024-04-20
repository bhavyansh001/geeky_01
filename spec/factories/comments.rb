FactoryBot.define do
  factory :comment do
    name { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
    article_id { create(:article).id }
    user_id { create(:user).id }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
