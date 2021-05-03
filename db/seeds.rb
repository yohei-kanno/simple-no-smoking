s1 = Date.parse("1950/01/01")
s2 = Date.parse("2000/3/31")

5.times do |n|
  User.create(
    name: "example#{n}",
    email: "user#{n}@example.com",
    password: "foobar",
    birth_date: Random.rand(s1 .. s2)
  )
end
