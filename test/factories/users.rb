FactoryBot.define do
  factory :user do
    name { "user" }
    sequence(:email){ |n| "user#{n}@example.com" }
    birth_date{ Date.current }
    password{ "password" }
    password_confirmation{ "password" }
  end
end
