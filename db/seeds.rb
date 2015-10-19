User.create!( first_name:  "Example",
              last_name: "User",
              email: "example@railstutorial.org",
              password:              "password",
              password_confirmation: "password",
              admin: true)

99.times do |n|
  name = Faker::Name.name.split(" ")
  first_name = name[0]
  last_name = name[1]
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name: first_name,
               last_name: last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end
