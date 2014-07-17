Fabricator(:customer) do
  email {Faker::Internet.email}
  name 'Ian Knauer'
  phone '6044691260'
end