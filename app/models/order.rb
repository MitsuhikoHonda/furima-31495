# Formオブジェクト 購入情報(purchase_logクラス)と配送先(shipping_adressの属性)をまとめたFormから、それぞれのテーブルに情報を保存するクラス(先にそれぞれのクラス(モデル)を定義、作成)
# バリデーションもまとめている(AcriveModel::Modelをインクルードすることで、ヘルパーメソッドの引数として扱えたり、バリデーションの機能が使えるようになる。)

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
    validates :token
    # validates :phone_number, digits_between:1,11, message: "input only number" 
  end

    validates :ship_from_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
        # 購入履歴の情報を保存
        purchase_log = PurchaseLog.create(user_id: user_id, item_id: item_id)
        # 送付先住所の情報を保存
        ShippingAddress.create(purchase_log_id: purchase_log.id, postal_code: postal_code, ship_from_id: ship_from_id, municipality: municipality, block_number: block_number, building_name: building_name, phone_number: phone_number)
  end
end