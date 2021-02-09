class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase_log
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :ship_from_id, presence: true
  validates :day_to_ship_id, presence: true
  validates :selling_price, presence: true

end
