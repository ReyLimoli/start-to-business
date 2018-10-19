FactoryBot.define do
  factory :user do
    name { 'Joao' }
    email { 'joao@email.com' }
    password { '12345678' }
    linkedin { 'http://linkedin.com/joao' }
    birth_day { 30.years.ago }
    document { '100200300' }

    trait :investor do
      amount_available_to_invest { 500 }
    end
  end
end
