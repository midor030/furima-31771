class Order < ApplicationRecord
  attr_accessor :token, :user_id, :item_id
  validates :token, presence: true

  belongs_to :item
  has_one :address
  belongs_to :user
end