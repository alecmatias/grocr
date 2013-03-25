FactoryGirl.define do
  factory :item do
    sequence(:product_id) { 110 + n }
    quantity 1
  end
end
