require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報の保存' do
    context '出品情報が保存できる場合' do
      it 'image、item_name、description、category_id、condition_id、delivery_fee_id、ship_from_id、day_to_ship_id、selling_priceがあれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '出品情報が保存できない場合' do
      it 'imageが空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では投稿できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空では投稿できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryを選択せずに投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択してください")
      end
      it 'condition選択せずに投稿できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を選択してください")
      end
      it 'delivery_fee選択せずに投稿できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee を選択してください")
      end
      it 'ship_from選択せずに投稿できない' do
        @item.ship_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from を選択してください")
      end
      it 'day_to_ship選択せずに投稿できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship を選択してください")
      end
      it 'selling_priceが空では投稿できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it 'selling_priceが299以下では登録できない' do
        @item.selling_price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price には300円〜9999999円の範囲で半角数字を使用してください")
      end
      it 'selling_priceが9999999以上では登録できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price には300円〜9999999円の範囲で半角数字を使用してください")
      end
      it 'selling_priceが全角では登録できない' do
        @item.selling_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price には300円〜9999999円の範囲で半角数字を使用してください")
      end
      it 'selling_priceが半角英数混合では登録できない' do
        @item.selling_price = 'a200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price には300円〜9999999円の範囲で半角数字を使用してください")
      end
      it 'selling_priceが半角英語だけでは登録できない' do
        @item.selling_price = 'hundred'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price には300円〜9999999円の範囲で半角数字を使用してください")
      end
    end
  end
end
