class UserItem
  include ActiveModel::Model
  attr_accessor :item, :user, :postcode, :prefecture, :cities, :address, :building, :tel

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cities
    validates :address
    validates :tel, numericality: { only_integer: true, messages: "is invalid. Input half-width characters"}
  end

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }


  def save
    user = currenr_user
    Address.create(postcode: postcode, prefecture: prefecture, cities: cities, address: address, building: building, tel: tel,user: user.id)
    Oder.create(item_id: item.id, user_id: user.id)
  end
end