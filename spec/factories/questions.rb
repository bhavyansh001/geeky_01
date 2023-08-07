FactoryBot.define do
  factory :question do
    expression { "MyString" }
    solution { "MyString" }
    time_taken { 1 }
    is_correct { false }
    user { nil }
  end
end
