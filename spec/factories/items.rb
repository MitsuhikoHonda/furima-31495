FactoryBot.define do
  factory :item do
    item_name             {'test'}
    description           {Faker::Lorem.sentence}
    category_id           {'2'}
    condition_id          {'2'}
    delivery_fee_id       {'2'}
    ship_from_id          {'2'}
    day_to_ship_id        {'2'}
    selling_price         {'5000'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
