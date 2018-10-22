FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "teste#{n}@email.com"
    end
    name { 'Joao' }
    password { '12345678' }
    linkedin { 'http://linkedin.com/joao' }
    birth_day { 30.years.ago }
    document { '100200300' }

    trait :investor do
      amount_available_to_invest { 500 }
    end
  end
end
