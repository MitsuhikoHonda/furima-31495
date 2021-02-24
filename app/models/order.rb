class Order
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:ship_from_id,:municipality,:block_number,:building_name,:phone_number, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly" }
    validates :municipality
    validates :block_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "input only number" }
    validates :phone_number, length: { maximum: 11, message: "input correctly" }
    validates :token
  end

    validates :ship_from_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
        # 購入履歴の情報を保存
        purchase_log = PurchaseLog.create(user_id: user_id, item_id: item_id)
        # 送付先住所の情報を保存
        ShippingAddress.create(purchase_log_id: purchase_log.id, postal_code: postal_code, ship_from_id: ship_from_id, municipality: municipality, block_number: block_number, building_name: building_name, phone_number: phone_number)
  end
end