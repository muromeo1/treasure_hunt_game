FactoryBot.define do
  factory :location_history do
    association(:user)

    email { user.email }
    current_location { [Faker::Address.latitude, Faker::Address.longitude] }
    destination { TreasureHunt::LOCATION }
    radius { Faker::Number.number(digits: 1) }
  end
end
