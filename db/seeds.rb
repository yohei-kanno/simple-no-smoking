s1 = Date.parse("1950/01/01")
s2 = Date.parse("2000/3/31")

50.times do |n|
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
    hourly_wage: 500 + (n * 500),
    start_date: Date.current-n
  )
  Mode.create(
    user_id: user.id,
    mode: 0
  )
end

50.times do |n|
  user = User.create(
    name: "example#{n + 50}",
    email: "user#{n + 50}@example.com",
    password: "foobar",
    birth_date: Random.rand(s1 .. s2)
  )
  ReductionUserProfile.create(
    user_id: user.id,
    tabaco_price: 100 + (n * 100),
    smoking_pace: 10 + (n * 10),
    hourly_wage: 500 + (n * 500),
    start_date: Date.current-n
  )
  Mode.create(
    user_id: user.id,
    mode: 1
  )
end
