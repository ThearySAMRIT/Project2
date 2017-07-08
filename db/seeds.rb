User.create! full_name: "SAMRIT Sotheary", email: "somrithsotheary@gmail.com",
  password: "12345678", gender: "male", admin: true

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "1234567"
  User.create! full_name: name, email: email, password: password, gender: "male"
end

users = User.order :created_at.take 6
20.times do
  title = Faker::Lorem.sentence 5
  content = Faker::Lorem.sentence 5
  users.each {|user| user.posts.create!(title: title, content: content)}
end
