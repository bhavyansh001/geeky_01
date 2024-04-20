FactoryBot.define do
    factory :practice_area_level_up_session_question, class: 'PracticeArea::LevelUpSessionQuestion' do
      association :level_up_session, factory: :practice_area_level_up_session
      association :question, factory: :practice_area_question
      created_at { Time.current }
      updated_at { Time.current }
    end
  end
