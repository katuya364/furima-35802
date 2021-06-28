FactoryBot.define do
  factory :item do
    item_name          { 'あ' }
    item_description   { 'あ' }
    category_id        { 2 }
    condition_id       { 2 }
    shipping_charge_id { 2 }
    prefecture_id      { 2 }
    day_id             { 2 }
    price              { 300 }
    association :user
  end
end
