FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'aaa123'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    kana_last_name        {'ヤマダ'}
    kana_first_name       {'タロウ'}
    birth_date            {'1986-03-04'}
  end
end