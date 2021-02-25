class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :check_user, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :delivery_fee_id, :ship_from_id, :day_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    if current_user.id != @item.user_id || @item.purchase_log.present?
      redirect_to root_path
    end
  end


end