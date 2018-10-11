FactoryBot.define do
  factory :idea do
    title { "MyString" }
    description { "MyString" }
    estimated_project_time { 1 }
    initial_investment_value { "9.99" }
    estimated_time_to_profit { 1 }
  end
end
