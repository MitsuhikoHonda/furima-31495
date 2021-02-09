class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :delivery_fee_id, :ship_from_id, :day_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end

end