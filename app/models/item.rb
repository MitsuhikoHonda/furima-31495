class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_log
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :ship_from
  belongs_to :day_to_ship

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :selling_price
  end
  
  validates_inclusion_of :selling_price, in: 300..9999999, message: 'には300円〜9999999円の範囲で半角数字を使用してください'
  
  with_options numericality: { other_than: 1, message: 'を選択してください'} do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :ship_from_id
    validates :day_to_ship_id
  end
end
