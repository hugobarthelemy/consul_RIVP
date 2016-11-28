admin = User.create!(username: 'admin', email: 'admin@consul.dev', password: '12345678', password_confirmation: '12345678', confirmed_at: Time.now, terms_of_service: "1")
admin.create_administrator

def create_user(email, username = Faker::Name.name)
  pwd = '12345678'
  puts "    #{username}"
  User.create!(username: username, email: email, password: pwd, password_confirmation: pwd, confirmed_at: Time.now, terms_of_service: "1")
end

# Alain
User.create!(username: 'alain',
  email: 'alain@consul.dev',
  password: '12345678',
  password_confirmation: '12345678',
  residence_verified_at: Time.now,
  confirmed_phone: Faker::PhoneNumber.phone_number,
  document_type: "1",
  verified_at: Time.now,
  document_number: "1")

# Valentin
User.create!(username: 'valentin',
  email: 'valentin@consul.dev',
  password: '12345678',
  password_confirmation: '12345678',
  residence_verified_at: Time.now,
  confirmed_phone: Faker::PhoneNumber.phone_number,
  document_type: "1",
  verified_at: Time.now,
  document_number: "2")

# Olivier
User.create!(username: 'olivier',
  email: 'olivier@consul.dev',
  password: '12345678',
  password_confirmation: '12345678',
  residence_verified_at: Time.now,
  confirmed_phone: Faker::PhoneNumber.phone_number,
  document_type: "1",
  verified_at: Time.now,
  document_number: "3")

# Hugo
User.create!(username: 'hugo',
  email: 'hugo@consul.dev',
  password: '12345678',
  password_confirmation: '12345678',
  residence_verified_at: Time.now,
  confirmed_phone: Faker::PhoneNumber.phone_number,
  document_type: "1",
  verified_at: Time.now,
  document_number: "4")


puts "Creating Geozones"
listofbuilding = ['75011 - 3 rue de la Roquette, Paris', '75014 - 1 rue de Perceval, Paris']
listofbuilding.each{ |i| Geozone.create(name: "#{i}") }
