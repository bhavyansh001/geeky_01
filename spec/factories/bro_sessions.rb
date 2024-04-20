FactoryBot.define do
  factory :bro_session do
    question_id { create(:question).id }
    participant_id { create(:participant).id }
    room_id { create(:room).id }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
