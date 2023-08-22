FactoryBot.define do
  factory :question, class: 'PracticeArea::Question' do
    expression { "MyString" }
    solution { 99 }
    time_taken { 1 }
    is_correct { false }
  end
end
