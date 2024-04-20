FactoryBot.define do
    factory :practice_area_level_up_session, class: 'PracticeArea::LevelUpSession' do
      user
      created_at { Time.current }
      updated_at { Time.current }
    end
  end
