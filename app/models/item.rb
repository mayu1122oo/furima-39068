class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :item_state
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date
  has_one_attached :image
  has_one :order

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :item_state_id, numericality: { other_than: 1 }
  validates :delivery_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :ship_date_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image, presence: true

end
