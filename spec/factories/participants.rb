FactoryBot.define do
  factory :participant do
    user_id { create(:user).id }
    room_id { create(:room).id }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
