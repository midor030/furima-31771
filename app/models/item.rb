class Item < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :image
  
  validates :item, presence: true
  validates :image, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :load_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true
end
