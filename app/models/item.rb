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
  
  with_options presence: true, format: { with: /[3-9][0-9][0-9]|[1-9][0-9][0-9][0-9]|[1-9][0-9][0-9][0-9][0-9]||[1-9][0-9][0-9][0-9][0-9][0-9][1-9][0-9][0-9][0-9][0-9][0-9][0-9]/, message: 'には300円〜9999999円の範囲で半角数字を使用してください' } do
    validates :selling_price
  # 上述は綺麗ではないのでメンターさんに模範回答を聞く。
  # 一度バリデーションがかかると手数料、販売利益の数値が消える。JSの記述方法に問題あり？確認する。
  end



end
