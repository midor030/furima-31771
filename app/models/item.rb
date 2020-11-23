class Item < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :load
  belongs_to :area
  belongs_to :day

  validates :item, presence: true
  validates :image, presence: true
  validates :explain, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :state_id, numericality: { other_than: 1 }, presence: true
  validates :load_id, numericality: { other_than: 1 }, presence: true
  validates :area_id, numericality: { other_than: 1 }, presence: true
  validates :day_id, numericality: { other_than: 1 }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }, presence: true
end
