FactoryBot.define do
  factory :no_smoking_user_profile do
    tabaco_price { 550 }
    smoking_pace { 30 }
    hourly_wage { 1400 }
    start_date { Date.current}
    user { :user }
  end
end
