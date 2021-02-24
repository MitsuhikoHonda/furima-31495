class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
    if current_user.id == @item.user_id || @item.purchase_log.present?
      redirect_to root_path
    end
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  
  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:postal_code,:ship_from_id,:municipality,:block_number,:building_name,:phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.selling_price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end