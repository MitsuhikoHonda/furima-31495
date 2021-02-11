class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase_log
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :ship_from
  belongs_to :day_to_ship

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1}
  validates :condition_id, numericality: { other_than: 1}
  validates :delivery_fee_id, numericality: { other_than: 1}
  validates :ship_from_id, numericality: { other_than: 1}
  validates :day_to_ship_id, numericality: { other_than: 1}
  validates :selling_price, presence: true

end
