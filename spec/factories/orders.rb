FactoryBot.define do
  factory :order do
    user_id    {1}
    item_id    {1}
    postal_code      {'123-4567'}
    ship_from_id     {2}
    municipality     {'テスト市'}
    block_number     {'1-1'}
    building_name    {'テストビル'}
    phone_number     {'1234567'}
    token            {"tok_abcdefghijk00000000000000000"}
    price            {1000}
  end
end
