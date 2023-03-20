class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :ship_date
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :item_state_id, numericality: { other_than: 1 }
  validates :delivery_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :ship_date_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :image, presence: true


end
