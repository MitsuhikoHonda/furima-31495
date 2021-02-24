require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id )
    sleep 1
  end

  describe '購入情報の保存' do
    context '購入情報が保存できる場合' do
      it 'user_id, item_id, postal_code, ship_from_id, municipality, block_number, phone_number, tokenがあれば保存できる' do
        expect(@order).to be_valid
      end
      it 'builidng_nameは空でも保存できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '購入情報が保存できない場合' do
      it 'user_idが空では投稿できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では投稿できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空では投稿できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角数字以外では投稿できない' do
        @order.postal_code = '１２３-４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code input correctly")
      end
      it 'postal_codeが[3文字半角数字-4文字半角数字]以外では投稿できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code input correctly")
      end
      it 'municipalityが空では投稿できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'block_numberが空では投稿できない' do
        @order.block_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block number can't be blank")
      end
      it 'phone numberが空では投稿できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone numberが英数字混合では投稿できない' do
        @order.phone_number = '080aaa1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number input only number")
      end
      it 'phone numberは半角数字以外では投稿できない' do
        @order.phone_number = '１２３４５６７８９'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number input only number")
      end
      it 'phone numberは11桁以上では投稿できない' do
        @order.phone_number = '000123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number input correctly")
      end
      it 'ship_from選択せずに投稿できない' do
        @order.ship_from_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Ship from を選択してください")
      end
      it 'tokenが空では投稿できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end