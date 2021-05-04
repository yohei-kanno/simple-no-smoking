s1 = Date.parse("1950/01/01")
s2 = Date.parse("2000/3/31")

5.times do |n|
  user = User.create(
    name: "example#{n}",
    email: "user#{n}@example.com",
    password: "foobar",
    birth_date: Random.rand(s1 .. s2)
  )
  NoSmokingUserProfile.create(
    user_id: user.id,
    tabaco_price: 100 + (n * 100),
    smoking_pace: 10 + (n * 10),
    hourly_wage: 500 + (n * 500)
  )
end
