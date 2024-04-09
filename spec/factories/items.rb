FactoryBot.define do
  factory :item do
    item_name {Faker::Name.name}
    describe {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 11)}
    state_id {Faker::Number.between(from: 2, to: 7)}
    shipping_charge_id {Faker::Number.between(from: 2, to: 3)}
    from_id {Faker::Number.between(from: 2, to: 48)}
    transport_day_id {Faker::Number.between(from: 2, to: 4)}
    sale_price {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
