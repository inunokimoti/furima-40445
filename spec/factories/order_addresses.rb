FactoryBot.define do
  factory :order_address do

    address = Gimei.address

    post_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    from_id { Faker::Number.between(from: 2, to: 48) }
    adderss_city { address.city.kanji }
    adderss_number { address.town.kanji + '1-1-1' }
    adderss_bilding_name { address.town.kanji + 'ビル101' }
    tel_number { Faker::Number.leading_zero_number(digits: 10) || Faker::Number.leading_zero_number(digits: 11) }
    token {"tok_abcdefghijk00000000000000000"}
    sale_price { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
