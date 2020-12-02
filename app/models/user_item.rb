class UserItem
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture, :cities, :address, :building, :tel, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cities
    validates :address
    validates :token
    validates :tel, numericality: { only_integer: true, messages: "is invalid. Input half-width characters"}
  end

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }


  def save
    binding.pry
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecuture_id: prefecture, cities: cities, address: address, building: building, tel: tel, order_id: order.id)
  end
end