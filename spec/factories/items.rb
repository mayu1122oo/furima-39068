FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials(number: 2) }
    description      { Faker::Lorem.sentence }
    category_id      { 2 }
    item_state_id    { 2 }
    delivery_cost_id { 2 }
    prefecture_id    { 2 }
    ship_date_id     { 2 }
    price            { Faker::Number.between(from: 300, to: 9999999) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

  end
end
