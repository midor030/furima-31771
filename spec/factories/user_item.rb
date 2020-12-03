FactoryBot.define do
  factory :user_item do
    postcode       { '123-4567' }
    prefecture     { '3' }
    cities         { '東京' }
    address        { '青山1-1' }
    building       { '柳ビル103' }
    tel            { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
