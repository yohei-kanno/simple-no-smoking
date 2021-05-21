FactoryBot.define do
  factory :user do
    name { "user" }
    sequence(:email){ |n| "user#{n}@example.com" }
    birth_date{ Date.current }
    password{ "password" }
    password_confirmation{ "password" }
    利用規約 {"1"}
  end
end
