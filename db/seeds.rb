User.create!(fullname: "Admin",
  email: "admin@gmail.com",
  gender: "Male",
  password: "123123123",
  password_confirmation: "123123123",
  admin: true,
  money: 300)

["Africa", "Asia", "Europe", "North America", "South America",
  "Antarctica", "Australia", "Oceania"].each do |con|
  Continent.create!(name: con)
end
