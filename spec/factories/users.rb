FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'1a1a1a'}
    password_confirmation {password}
    first_name_kanji      {'あ'}
    last_name_kanji       {'あ'}
    first_name_kana       {'ア'}
    last_name_kana        {'ア'}
    birthday              {'1993/02/02'}
  end
end