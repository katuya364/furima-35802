FactoryBot.define do
  factory :order_shipping_address do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    municipality  { '横浜' }
    address       { '青山1-1-1' }
    building_name { 'てすと' }
    phone_number  { '09009009009' }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
