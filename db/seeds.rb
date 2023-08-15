# seeds.rb

# Create User
User.create!(
  name: "John Doe",
  email: "mike@example.com",
  password: "password", # The password will be encrypted automatically
  password_confirmation: "password"
)

# Create Groups
groups = []
3.times do |i|
  group = Group.create!(
    name: "Group #{i+1}",
    icon: "icon-#{i+1}"
  )
  groups << group
end

# Create Operations
groups.each do |g|
  3.times do |i|
    operation = g.operations.create!(
      name: "Operation #{i+1} of #{g.name}",
      amount: rand(1..1000),
      author: user
    )
    puts "Created Operation: #{operation.name}"
  end
end