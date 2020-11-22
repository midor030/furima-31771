FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    familyname_kanji      { '安倍' }
    firstname_kanji       { '晋三' }
    familyname_kana       { 'アベ' }
    firstname_kana        { 'シンゾウ' }
    birthday              { '1980-12-30' }
  end
end
