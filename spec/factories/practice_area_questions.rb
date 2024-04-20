FactoryBot.define do
  factory :practice_area_question, class: 'PracticeArea::Question' do
    expression { Faker::Lorem.sentence }
    solution { Faker::Lorem.sentence }
    time_taken { rand(1..100) }
    is_correct { [true, false].sample }
    user
    created_at { Time.current }
    updated_at { Time.current }
  end
end
