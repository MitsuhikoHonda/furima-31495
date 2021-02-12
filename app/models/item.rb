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

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'を選択してください'}
  validates :condition_id, numericality: { other_than: 1, message: 'を選択してください'}
  validates :delivery_fee_id, numericality: { other_than: 1, message: 'を選択してください'}
  validates :ship_from_id, numericality: { other_than: 1, message: 'を選択してください'}
  validates :day_to_ship_id, numericality: { other_than: 1, message: 'を選択してください'}
  validates :selling_price, presence: true
  validates_inclusion_of :selling_price, in: 300..9999999, message: 'には300円〜9999999円の範囲で半角数字を使用してください'


end
